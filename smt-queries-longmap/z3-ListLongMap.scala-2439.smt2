; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38438 () Bool)

(assert start!38438)

(declare-fun b!396439 () Bool)

(declare-fun e!239847 () Bool)

(declare-fun e!239850 () Bool)

(declare-fun mapRes!16428 () Bool)

(assert (=> b!396439 (= e!239847 (and e!239850 mapRes!16428))))

(declare-fun condMapEmpty!16428 () Bool)

(declare-datatypes ((V!14267 0))(
  ( (V!14268 (val!4980 Int)) )
))
(declare-datatypes ((ValueCell!4592 0))(
  ( (ValueCellFull!4592 (v!7221 V!14267)) (EmptyCell!4592) )
))
(declare-datatypes ((array!23639 0))(
  ( (array!23640 (arr!11269 (Array (_ BitVec 32) ValueCell!4592)) (size!11622 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23639)

(declare-fun mapDefault!16428 () ValueCell!4592)

(assert (=> b!396439 (= condMapEmpty!16428 (= (arr!11269 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4592)) mapDefault!16428)))))

(declare-fun mapIsEmpty!16428 () Bool)

(assert (=> mapIsEmpty!16428 mapRes!16428))

(declare-fun b!396441 () Bool)

(declare-fun e!239845 () Bool)

(assert (=> b!396441 (= e!239845 false)))

(declare-fun lt!186958 () Bool)

(declare-datatypes ((array!23641 0))(
  ( (array!23642 (arr!11270 (Array (_ BitVec 32) (_ BitVec 64))) (size!11623 (_ BitVec 32))) )
))
(declare-fun lt!186959 () array!23641)

(declare-datatypes ((List!6493 0))(
  ( (Nil!6490) (Cons!6489 (h!7345 (_ BitVec 64)) (t!11658 List!6493)) )
))
(declare-fun arrayNoDuplicates!0 (array!23641 (_ BitVec 32) List!6493) Bool)

(assert (=> b!396441 (= lt!186958 (arrayNoDuplicates!0 lt!186959 #b00000000000000000000000000000000 Nil!6490))))

(declare-fun b!396442 () Bool)

(declare-fun res!227519 () Bool)

(declare-fun e!239848 () Bool)

(assert (=> b!396442 (=> (not res!227519) (not e!239848))))

(declare-fun _keys!709 () array!23641)

(assert (=> b!396442 (= res!227519 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6490))))

(declare-fun b!396443 () Bool)

(declare-fun res!227516 () Bool)

(assert (=> b!396443 (=> (not res!227516) (not e!239848))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396443 (= res!227516 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16428 () Bool)

(declare-fun tp!32223 () Bool)

(declare-fun e!239849 () Bool)

(assert (=> mapNonEmpty!16428 (= mapRes!16428 (and tp!32223 e!239849))))

(declare-fun mapRest!16428 () (Array (_ BitVec 32) ValueCell!4592))

(declare-fun mapKey!16428 () (_ BitVec 32))

(declare-fun mapValue!16428 () ValueCell!4592)

(assert (=> mapNonEmpty!16428 (= (arr!11269 _values!549) (store mapRest!16428 mapKey!16428 mapValue!16428))))

(declare-fun b!396444 () Bool)

(declare-fun res!227517 () Bool)

(assert (=> b!396444 (=> (not res!227517) (not e!239848))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396444 (= res!227517 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11623 _keys!709))))))

(declare-fun b!396445 () Bool)

(declare-fun res!227515 () Bool)

(assert (=> b!396445 (=> (not res!227515) (not e!239848))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396445 (= res!227515 (validMask!0 mask!1025))))

(declare-fun res!227514 () Bool)

(assert (=> start!38438 (=> (not res!227514) (not e!239848))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38438 (= res!227514 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11623 _keys!709))))))

(assert (=> start!38438 e!239848))

(assert (=> start!38438 true))

(declare-fun array_inv!8270 (array!23639) Bool)

(assert (=> start!38438 (and (array_inv!8270 _values!549) e!239847)))

(declare-fun array_inv!8271 (array!23641) Bool)

(assert (=> start!38438 (array_inv!8271 _keys!709)))

(declare-fun b!396440 () Bool)

(declare-fun res!227512 () Bool)

(assert (=> b!396440 (=> (not res!227512) (not e!239848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396440 (= res!227512 (validKeyInArray!0 k0!794))))

(declare-fun b!396446 () Bool)

(declare-fun res!227511 () Bool)

(assert (=> b!396446 (=> (not res!227511) (not e!239848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23641 (_ BitVec 32)) Bool)

(assert (=> b!396446 (= res!227511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396447 () Bool)

(declare-fun tp_is_empty!9871 () Bool)

(assert (=> b!396447 (= e!239850 tp_is_empty!9871)))

(declare-fun b!396448 () Bool)

(assert (=> b!396448 (= e!239849 tp_is_empty!9871)))

(declare-fun b!396449 () Bool)

(assert (=> b!396449 (= e!239848 e!239845)))

(declare-fun res!227520 () Bool)

(assert (=> b!396449 (=> (not res!227520) (not e!239845))))

(assert (=> b!396449 (= res!227520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186959 mask!1025))))

(assert (=> b!396449 (= lt!186959 (array!23642 (store (arr!11270 _keys!709) i!563 k0!794) (size!11623 _keys!709)))))

(declare-fun b!396450 () Bool)

(declare-fun res!227513 () Bool)

(assert (=> b!396450 (=> (not res!227513) (not e!239848))))

(assert (=> b!396450 (= res!227513 (or (= (select (arr!11270 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11270 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396451 () Bool)

(declare-fun res!227518 () Bool)

(assert (=> b!396451 (=> (not res!227518) (not e!239848))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396451 (= res!227518 (and (= (size!11622 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11623 _keys!709) (size!11622 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38438 res!227514) b!396445))

(assert (= (and b!396445 res!227515) b!396451))

(assert (= (and b!396451 res!227518) b!396446))

(assert (= (and b!396446 res!227511) b!396442))

(assert (= (and b!396442 res!227519) b!396444))

(assert (= (and b!396444 res!227517) b!396440))

(assert (= (and b!396440 res!227512) b!396450))

(assert (= (and b!396450 res!227513) b!396443))

(assert (= (and b!396443 res!227516) b!396449))

(assert (= (and b!396449 res!227520) b!396441))

(assert (= (and b!396439 condMapEmpty!16428) mapIsEmpty!16428))

(assert (= (and b!396439 (not condMapEmpty!16428)) mapNonEmpty!16428))

(get-info :version)

(assert (= (and mapNonEmpty!16428 ((_ is ValueCellFull!4592) mapValue!16428)) b!396448))

(assert (= (and b!396439 ((_ is ValueCellFull!4592) mapDefault!16428)) b!396447))

(assert (= start!38438 b!396439))

(declare-fun m!391515 () Bool)

(assert (=> b!396449 m!391515))

(declare-fun m!391517 () Bool)

(assert (=> b!396449 m!391517))

(declare-fun m!391519 () Bool)

(assert (=> b!396445 m!391519))

(declare-fun m!391521 () Bool)

(assert (=> mapNonEmpty!16428 m!391521))

(declare-fun m!391523 () Bool)

(assert (=> start!38438 m!391523))

(declare-fun m!391525 () Bool)

(assert (=> start!38438 m!391525))

(declare-fun m!391527 () Bool)

(assert (=> b!396450 m!391527))

(declare-fun m!391529 () Bool)

(assert (=> b!396440 m!391529))

(declare-fun m!391531 () Bool)

(assert (=> b!396443 m!391531))

(declare-fun m!391533 () Bool)

(assert (=> b!396441 m!391533))

(declare-fun m!391535 () Bool)

(assert (=> b!396442 m!391535))

(declare-fun m!391537 () Bool)

(assert (=> b!396446 m!391537))

(check-sat (not b!396442) (not b!396445) tp_is_empty!9871 (not start!38438) (not mapNonEmpty!16428) (not b!396446) (not b!396440) (not b!396443) (not b!396449) (not b!396441))
(check-sat)
