; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82052 () Bool)

(assert start!82052)

(declare-fun b!956905 () Bool)

(declare-fun e!539242 () Bool)

(declare-fun tp_is_empty!21075 () Bool)

(assert (=> b!956905 (= e!539242 tp_is_empty!21075)))

(declare-fun res!640668 () Bool)

(declare-fun e!539243 () Bool)

(assert (=> start!82052 (=> (not res!640668) (not e!539243))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82052 (= res!640668 (validMask!0 mask!2088))))

(assert (=> start!82052 e!539243))

(assert (=> start!82052 true))

(declare-datatypes ((V!33083 0))(
  ( (V!33084 (val!10588 Int)) )
))
(declare-datatypes ((ValueCell!10056 0))(
  ( (ValueCellFull!10056 (v!13144 V!33083)) (EmptyCell!10056) )
))
(declare-datatypes ((array!58249 0))(
  ( (array!58250 (arr!28003 (Array (_ BitVec 32) ValueCell!10056)) (size!28482 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58249)

(declare-fun e!539241 () Bool)

(declare-fun array_inv!21725 (array!58249) Bool)

(assert (=> start!82052 (and (array_inv!21725 _values!1386) e!539241)))

(declare-datatypes ((array!58251 0))(
  ( (array!58252 (arr!28004 (Array (_ BitVec 32) (_ BitVec 64))) (size!28483 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58251)

(declare-fun array_inv!21726 (array!58251) Bool)

(assert (=> start!82052 (array_inv!21726 _keys!1668)))

(declare-fun b!956906 () Bool)

(declare-fun e!539244 () Bool)

(declare-fun mapRes!33577 () Bool)

(assert (=> b!956906 (= e!539241 (and e!539244 mapRes!33577))))

(declare-fun condMapEmpty!33577 () Bool)

(declare-fun mapDefault!33577 () ValueCell!10056)

(assert (=> b!956906 (= condMapEmpty!33577 (= (arr!28003 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10056)) mapDefault!33577)))))

(declare-fun mapNonEmpty!33577 () Bool)

(declare-fun tp!64182 () Bool)

(assert (=> mapNonEmpty!33577 (= mapRes!33577 (and tp!64182 e!539242))))

(declare-fun mapRest!33577 () (Array (_ BitVec 32) ValueCell!10056))

(declare-fun mapKey!33577 () (_ BitVec 32))

(declare-fun mapValue!33577 () ValueCell!10056)

(assert (=> mapNonEmpty!33577 (= (arr!28003 _values!1386) (store mapRest!33577 mapKey!33577 mapValue!33577))))

(declare-fun b!956907 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!956907 (= e!539243 (and (= (size!28482 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28483 _keys!1668) (size!28482 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (not (= (size!28483 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)))))))

(declare-fun b!956908 () Bool)

(assert (=> b!956908 (= e!539244 tp_is_empty!21075)))

(declare-fun mapIsEmpty!33577 () Bool)

(assert (=> mapIsEmpty!33577 mapRes!33577))

(assert (= (and start!82052 res!640668) b!956907))

(assert (= (and b!956906 condMapEmpty!33577) mapIsEmpty!33577))

(assert (= (and b!956906 (not condMapEmpty!33577)) mapNonEmpty!33577))

(get-info :version)

(assert (= (and mapNonEmpty!33577 ((_ is ValueCellFull!10056) mapValue!33577)) b!956905))

(assert (= (and b!956906 ((_ is ValueCellFull!10056) mapDefault!33577)) b!956908))

(assert (= start!82052 b!956906))

(declare-fun m!888081 () Bool)

(assert (=> start!82052 m!888081))

(declare-fun m!888083 () Bool)

(assert (=> start!82052 m!888083))

(declare-fun m!888085 () Bool)

(assert (=> start!82052 m!888085))

(declare-fun m!888087 () Bool)

(assert (=> mapNonEmpty!33577 m!888087))

(check-sat (not start!82052) (not mapNonEmpty!33577) tp_is_empty!21075)
(check-sat)
