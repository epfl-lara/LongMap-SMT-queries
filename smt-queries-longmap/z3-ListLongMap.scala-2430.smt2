; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38336 () Bool)

(assert start!38336)

(declare-fun mapNonEmpty!16338 () Bool)

(declare-fun mapRes!16338 () Bool)

(declare-fun tp!32133 () Bool)

(declare-fun e!239417 () Bool)

(assert (=> mapNonEmpty!16338 (= mapRes!16338 (and tp!32133 e!239417))))

(declare-datatypes ((V!14195 0))(
  ( (V!14196 (val!4953 Int)) )
))
(declare-datatypes ((ValueCell!4565 0))(
  ( (ValueCellFull!4565 (v!7200 V!14195)) (EmptyCell!4565) )
))
(declare-fun mapRest!16338 () (Array (_ BitVec 32) ValueCell!4565))

(declare-datatypes ((array!23536 0))(
  ( (array!23537 (arr!11220 (Array (_ BitVec 32) ValueCell!4565)) (size!11572 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23536)

(declare-fun mapValue!16338 () ValueCell!4565)

(declare-fun mapKey!16338 () (_ BitVec 32))

(assert (=> mapNonEmpty!16338 (= (arr!11220 _values!549) (store mapRest!16338 mapKey!16338 mapValue!16338))))

(declare-fun b!395468 () Bool)

(declare-fun e!239419 () Bool)

(assert (=> b!395468 (= e!239419 false)))

(declare-fun lt!187106 () Bool)

(declare-datatypes ((array!23538 0))(
  ( (array!23539 (arr!11221 (Array (_ BitVec 32) (_ BitVec 64))) (size!11573 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23538)

(declare-datatypes ((List!6377 0))(
  ( (Nil!6374) (Cons!6373 (h!7229 (_ BitVec 64)) (t!11543 List!6377)) )
))
(declare-fun arrayNoDuplicates!0 (array!23538 (_ BitVec 32) List!6377) Bool)

(assert (=> b!395468 (= lt!187106 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6374))))

(declare-fun b!395469 () Bool)

(declare-fun e!239420 () Bool)

(declare-fun e!239418 () Bool)

(assert (=> b!395469 (= e!239420 (and e!239418 mapRes!16338))))

(declare-fun condMapEmpty!16338 () Bool)

(declare-fun mapDefault!16338 () ValueCell!4565)

(assert (=> b!395469 (= condMapEmpty!16338 (= (arr!11220 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4565)) mapDefault!16338)))))

(declare-fun b!395470 () Bool)

(declare-fun tp_is_empty!9817 () Bool)

(assert (=> b!395470 (= e!239418 tp_is_empty!9817)))

(declare-fun mapIsEmpty!16338 () Bool)

(assert (=> mapIsEmpty!16338 mapRes!16338))

(declare-fun b!395471 () Bool)

(declare-fun res!226753 () Bool)

(assert (=> b!395471 (=> (not res!226753) (not e!239419))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23538 (_ BitVec 32)) Bool)

(assert (=> b!395471 (= res!226753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395472 () Bool)

(declare-fun res!226756 () Bool)

(assert (=> b!395472 (=> (not res!226756) (not e!239419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395472 (= res!226756 (validMask!0 mask!1025))))

(declare-fun b!395473 () Bool)

(declare-fun res!226755 () Bool)

(assert (=> b!395473 (=> (not res!226755) (not e!239419))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395473 (= res!226755 (and (= (size!11572 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11573 _keys!709) (size!11572 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395474 () Bool)

(assert (=> b!395474 (= e!239417 tp_is_empty!9817)))

(declare-fun res!226754 () Bool)

(assert (=> start!38336 (=> (not res!226754) (not e!239419))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38336 (= res!226754 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11573 _keys!709))))))

(assert (=> start!38336 e!239419))

(assert (=> start!38336 true))

(declare-fun array_inv!8300 (array!23536) Bool)

(assert (=> start!38336 (and (array_inv!8300 _values!549) e!239420)))

(declare-fun array_inv!8301 (array!23538) Bool)

(assert (=> start!38336 (array_inv!8301 _keys!709)))

(assert (= (and start!38336 res!226754) b!395472))

(assert (= (and b!395472 res!226756) b!395473))

(assert (= (and b!395473 res!226755) b!395471))

(assert (= (and b!395471 res!226753) b!395468))

(assert (= (and b!395469 condMapEmpty!16338) mapIsEmpty!16338))

(assert (= (and b!395469 (not condMapEmpty!16338)) mapNonEmpty!16338))

(get-info :version)

(assert (= (and mapNonEmpty!16338 ((_ is ValueCellFull!4565) mapValue!16338)) b!395474))

(assert (= (and b!395469 ((_ is ValueCellFull!4565) mapDefault!16338)) b!395470))

(assert (= start!38336 b!395469))

(declare-fun m!391761 () Bool)

(assert (=> mapNonEmpty!16338 m!391761))

(declare-fun m!391763 () Bool)

(assert (=> b!395472 m!391763))

(declare-fun m!391765 () Bool)

(assert (=> b!395468 m!391765))

(declare-fun m!391767 () Bool)

(assert (=> b!395471 m!391767))

(declare-fun m!391769 () Bool)

(assert (=> start!38336 m!391769))

(declare-fun m!391771 () Bool)

(assert (=> start!38336 m!391771))

(check-sat (not mapNonEmpty!16338) (not start!38336) (not b!395472) tp_is_empty!9817 (not b!395468) (not b!395471))
(check-sat)
