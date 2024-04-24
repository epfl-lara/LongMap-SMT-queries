; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38300 () Bool)

(assert start!38300)

(declare-fun b!395088 () Bool)

(declare-fun e!239209 () Bool)

(declare-fun tp_is_empty!9793 () Bool)

(assert (=> b!395088 (= e!239209 tp_is_empty!9793)))

(declare-fun b!395089 () Bool)

(declare-fun e!239210 () Bool)

(assert (=> b!395089 (= e!239210 tp_is_empty!9793)))

(declare-fun b!395090 () Bool)

(declare-fun res!226502 () Bool)

(declare-fun e!239213 () Bool)

(assert (=> b!395090 (=> (not res!226502) (not e!239213))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23486 0))(
  ( (array!23487 (arr!11196 (Array (_ BitVec 32) (_ BitVec 64))) (size!11548 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23486)

(assert (=> b!395090 (= res!226502 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11548 _keys!709))))))

(declare-fun mapNonEmpty!16299 () Bool)

(declare-fun mapRes!16299 () Bool)

(declare-fun tp!32094 () Bool)

(assert (=> mapNonEmpty!16299 (= mapRes!16299 (and tp!32094 e!239209))))

(declare-datatypes ((V!14163 0))(
  ( (V!14164 (val!4941 Int)) )
))
(declare-datatypes ((ValueCell!4553 0))(
  ( (ValueCellFull!4553 (v!7188 V!14163)) (EmptyCell!4553) )
))
(declare-fun mapRest!16299 () (Array (_ BitVec 32) ValueCell!4553))

(declare-datatypes ((array!23488 0))(
  ( (array!23489 (arr!11197 (Array (_ BitVec 32) ValueCell!4553)) (size!11549 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23488)

(declare-fun mapKey!16299 () (_ BitVec 32))

(declare-fun mapValue!16299 () ValueCell!4553)

(assert (=> mapNonEmpty!16299 (= (arr!11197 _values!549) (store mapRest!16299 mapKey!16299 mapValue!16299))))

(declare-fun b!395091 () Bool)

(declare-fun e!239211 () Bool)

(assert (=> b!395091 (= e!239211 (and e!239210 mapRes!16299))))

(declare-fun condMapEmpty!16299 () Bool)

(declare-fun mapDefault!16299 () ValueCell!4553)

(assert (=> b!395091 (= condMapEmpty!16299 (= (arr!11197 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4553)) mapDefault!16299)))))

(declare-fun res!226504 () Bool)

(assert (=> start!38300 (=> (not res!226504) (not e!239213))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38300 (= res!226504 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11548 _keys!709))))))

(assert (=> start!38300 e!239213))

(assert (=> start!38300 true))

(declare-fun array_inv!8276 (array!23488) Bool)

(assert (=> start!38300 (and (array_inv!8276 _values!549) e!239211)))

(declare-fun array_inv!8277 (array!23486) Bool)

(assert (=> start!38300 (array_inv!8277 _keys!709)))

(declare-fun mapIsEmpty!16299 () Bool)

(assert (=> mapIsEmpty!16299 mapRes!16299))

(declare-fun b!395092 () Bool)

(declare-fun res!226506 () Bool)

(assert (=> b!395092 (=> (not res!226506) (not e!239213))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395092 (= res!226506 (and (= (size!11549 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11548 _keys!709) (size!11549 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395093 () Bool)

(assert (=> b!395093 (= e!239213 (and (or (= (select (arr!11196 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11196 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!11548 _keys!709))))))

(declare-fun b!395094 () Bool)

(declare-fun res!226505 () Bool)

(assert (=> b!395094 (=> (not res!226505) (not e!239213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23486 (_ BitVec 32)) Bool)

(assert (=> b!395094 (= res!226505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395095 () Bool)

(declare-fun res!226507 () Bool)

(assert (=> b!395095 (=> (not res!226507) (not e!239213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395095 (= res!226507 (validMask!0 mask!1025))))

(declare-fun b!395096 () Bool)

(declare-fun res!226503 () Bool)

(assert (=> b!395096 (=> (not res!226503) (not e!239213))))

(declare-datatypes ((List!6368 0))(
  ( (Nil!6365) (Cons!6364 (h!7220 (_ BitVec 64)) (t!11534 List!6368)) )
))
(declare-fun arrayNoDuplicates!0 (array!23486 (_ BitVec 32) List!6368) Bool)

(assert (=> b!395096 (= res!226503 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6365))))

(declare-fun b!395097 () Bool)

(declare-fun res!226501 () Bool)

(assert (=> b!395097 (=> (not res!226501) (not e!239213))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395097 (= res!226501 (validKeyInArray!0 k0!794))))

(assert (= (and start!38300 res!226504) b!395095))

(assert (= (and b!395095 res!226507) b!395092))

(assert (= (and b!395092 res!226506) b!395094))

(assert (= (and b!395094 res!226505) b!395096))

(assert (= (and b!395096 res!226503) b!395090))

(assert (= (and b!395090 res!226502) b!395097))

(assert (= (and b!395097 res!226501) b!395093))

(assert (= (and b!395091 condMapEmpty!16299) mapIsEmpty!16299))

(assert (= (and b!395091 (not condMapEmpty!16299)) mapNonEmpty!16299))

(get-info :version)

(assert (= (and mapNonEmpty!16299 ((_ is ValueCellFull!4553) mapValue!16299)) b!395088))

(assert (= (and b!395091 ((_ is ValueCellFull!4553) mapDefault!16299)) b!395089))

(assert (= start!38300 b!395091))

(declare-fun m!391557 () Bool)

(assert (=> b!395093 m!391557))

(declare-fun m!391559 () Bool)

(assert (=> mapNonEmpty!16299 m!391559))

(declare-fun m!391561 () Bool)

(assert (=> b!395096 m!391561))

(declare-fun m!391563 () Bool)

(assert (=> b!395094 m!391563))

(declare-fun m!391565 () Bool)

(assert (=> start!38300 m!391565))

(declare-fun m!391567 () Bool)

(assert (=> start!38300 m!391567))

(declare-fun m!391569 () Bool)

(assert (=> b!395095 m!391569))

(declare-fun m!391571 () Bool)

(assert (=> b!395097 m!391571))

(check-sat (not mapNonEmpty!16299) (not b!395094) tp_is_empty!9793 (not b!395096) (not start!38300) (not b!395095) (not b!395097))
(check-sat)
