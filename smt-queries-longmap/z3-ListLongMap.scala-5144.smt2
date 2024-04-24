; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69950 () Bool)

(assert start!69950)

(declare-fun mapIsEmpty!22531 () Bool)

(declare-fun mapRes!22531 () Bool)

(assert (=> mapIsEmpty!22531 mapRes!22531))

(declare-fun b!812798 () Bool)

(declare-fun e!450124 () Bool)

(declare-fun tp_is_empty!13981 () Bool)

(assert (=> b!812798 (= e!450124 tp_is_empty!13981)))

(declare-fun res!555263 () Bool)

(declare-fun e!450123 () Bool)

(assert (=> start!69950 (=> (not res!555263) (not e!450123))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69950 (= res!555263 (validMask!0 mask!1312))))

(assert (=> start!69950 e!450123))

(declare-datatypes ((array!44183 0))(
  ( (array!44184 (arr!21154 (Array (_ BitVec 32) (_ BitVec 64))) (size!21574 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44183)

(declare-fun array_inv!17013 (array!44183) Bool)

(assert (=> start!69950 (array_inv!17013 _keys!976)))

(assert (=> start!69950 true))

(declare-datatypes ((V!23643 0))(
  ( (V!23644 (val!7038 Int)) )
))
(declare-datatypes ((ValueCell!6575 0))(
  ( (ValueCellFull!6575 (v!9464 V!23643)) (EmptyCell!6575) )
))
(declare-datatypes ((array!44185 0))(
  ( (array!44186 (arr!21155 (Array (_ BitVec 32) ValueCell!6575)) (size!21575 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44185)

(declare-fun e!450126 () Bool)

(declare-fun array_inv!17014 (array!44185) Bool)

(assert (=> start!69950 (and (array_inv!17014 _values!788) e!450126)))

(declare-fun b!812799 () Bool)

(declare-fun e!450125 () Bool)

(assert (=> b!812799 (= e!450125 tp_is_empty!13981)))

(declare-fun b!812800 () Bool)

(assert (=> b!812800 (= e!450126 (and e!450125 mapRes!22531))))

(declare-fun condMapEmpty!22531 () Bool)

(declare-fun mapDefault!22531 () ValueCell!6575)

(assert (=> b!812800 (= condMapEmpty!22531 (= (arr!21155 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6575)) mapDefault!22531)))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun b!812801 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!812801 (= e!450123 (and (= (size!21575 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21574 _keys!976) (size!21575 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (size!21574 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)))))))

(declare-fun mapNonEmpty!22531 () Bool)

(declare-fun tp!43639 () Bool)

(assert (=> mapNonEmpty!22531 (= mapRes!22531 (and tp!43639 e!450124))))

(declare-fun mapRest!22531 () (Array (_ BitVec 32) ValueCell!6575))

(declare-fun mapKey!22531 () (_ BitVec 32))

(declare-fun mapValue!22531 () ValueCell!6575)

(assert (=> mapNonEmpty!22531 (= (arr!21155 _values!788) (store mapRest!22531 mapKey!22531 mapValue!22531))))

(assert (= (and start!69950 res!555263) b!812801))

(assert (= (and b!812800 condMapEmpty!22531) mapIsEmpty!22531))

(assert (= (and b!812800 (not condMapEmpty!22531)) mapNonEmpty!22531))

(get-info :version)

(assert (= (and mapNonEmpty!22531 ((_ is ValueCellFull!6575) mapValue!22531)) b!812798))

(assert (= (and b!812800 ((_ is ValueCellFull!6575) mapDefault!22531)) b!812799))

(assert (= start!69950 b!812800))

(declare-fun m!755775 () Bool)

(assert (=> start!69950 m!755775))

(declare-fun m!755777 () Bool)

(assert (=> start!69950 m!755777))

(declare-fun m!755779 () Bool)

(assert (=> start!69950 m!755779))

(declare-fun m!755781 () Bool)

(assert (=> mapNonEmpty!22531 m!755781))

(check-sat (not start!69950) (not mapNonEmpty!22531) tp_is_empty!13981)
(check-sat)
