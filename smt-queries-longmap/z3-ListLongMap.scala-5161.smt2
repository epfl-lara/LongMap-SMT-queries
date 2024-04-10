; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69942 () Bool)

(assert start!69942)

(declare-fun b_free!12375 () Bool)

(declare-fun b_next!12375 () Bool)

(assert (=> start!69942 (= b_free!12375 (not b_next!12375))))

(declare-fun tp!43837 () Bool)

(declare-fun b_and!21143 () Bool)

(assert (=> start!69942 (= tp!43837 b_and!21143)))

(declare-fun b!813019 () Bool)

(declare-fun e!450446 () Bool)

(assert (=> b!813019 (= e!450446 false)))

(declare-datatypes ((V!23781 0))(
  ( (V!23782 (val!7090 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23781)

(declare-datatypes ((array!44386 0))(
  ( (array!44387 (arr!21254 (Array (_ BitVec 32) (_ BitVec 64))) (size!21675 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44386)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23781)

(declare-datatypes ((ValueCell!6627 0))(
  ( (ValueCellFull!6627 (v!9517 V!23781)) (EmptyCell!6627) )
))
(declare-datatypes ((array!44388 0))(
  ( (array!44389 (arr!21255 (Array (_ BitVec 32) ValueCell!6627)) (size!21676 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44388)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9288 0))(
  ( (tuple2!9289 (_1!4655 (_ BitVec 64)) (_2!4655 V!23781)) )
))
(declare-datatypes ((List!15118 0))(
  ( (Nil!15115) (Cons!15114 (h!16243 tuple2!9288) (t!21433 List!15118)) )
))
(declare-datatypes ((ListLongMap!8111 0))(
  ( (ListLongMap!8112 (toList!4071 List!15118)) )
))
(declare-fun lt!364224 () ListLongMap!8111)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2121 (array!44386 array!44388 (_ BitVec 32) (_ BitVec 32) V!23781 V!23781 (_ BitVec 32) Int) ListLongMap!8111)

(assert (=> b!813019 (= lt!364224 (getCurrentListMapNoExtraKeys!2121 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813020 () Bool)

(declare-fun e!450449 () Bool)

(declare-fun e!450447 () Bool)

(declare-fun mapRes!22705 () Bool)

(assert (=> b!813020 (= e!450449 (and e!450447 mapRes!22705))))

(declare-fun condMapEmpty!22705 () Bool)

(declare-fun mapDefault!22705 () ValueCell!6627)

(assert (=> b!813020 (= condMapEmpty!22705 (= (arr!21255 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6627)) mapDefault!22705)))))

(declare-fun b!813021 () Bool)

(declare-fun res!555480 () Bool)

(assert (=> b!813021 (=> (not res!555480) (not e!450446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44386 (_ BitVec 32)) Bool)

(assert (=> b!813021 (= res!555480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813022 () Bool)

(declare-fun res!555481 () Bool)

(assert (=> b!813022 (=> (not res!555481) (not e!450446))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813022 (= res!555481 (and (= (size!21676 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21675 _keys!976) (size!21676 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813023 () Bool)

(declare-fun tp_is_empty!14085 () Bool)

(assert (=> b!813023 (= e!450447 tp_is_empty!14085)))

(declare-fun b!813024 () Bool)

(declare-fun e!450448 () Bool)

(assert (=> b!813024 (= e!450448 tp_is_empty!14085)))

(declare-fun b!813025 () Bool)

(declare-fun res!555483 () Bool)

(assert (=> b!813025 (=> (not res!555483) (not e!450446))))

(declare-datatypes ((List!15119 0))(
  ( (Nil!15116) (Cons!15115 (h!16244 (_ BitVec 64)) (t!21434 List!15119)) )
))
(declare-fun arrayNoDuplicates!0 (array!44386 (_ BitVec 32) List!15119) Bool)

(assert (=> b!813025 (= res!555483 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15116))))

(declare-fun mapIsEmpty!22705 () Bool)

(assert (=> mapIsEmpty!22705 mapRes!22705))

(declare-fun mapNonEmpty!22705 () Bool)

(declare-fun tp!43836 () Bool)

(assert (=> mapNonEmpty!22705 (= mapRes!22705 (and tp!43836 e!450448))))

(declare-fun mapKey!22705 () (_ BitVec 32))

(declare-fun mapValue!22705 () ValueCell!6627)

(declare-fun mapRest!22705 () (Array (_ BitVec 32) ValueCell!6627))

(assert (=> mapNonEmpty!22705 (= (arr!21255 _values!788) (store mapRest!22705 mapKey!22705 mapValue!22705))))

(declare-fun res!555482 () Bool)

(assert (=> start!69942 (=> (not res!555482) (not e!450446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69942 (= res!555482 (validMask!0 mask!1312))))

(assert (=> start!69942 e!450446))

(assert (=> start!69942 tp_is_empty!14085))

(declare-fun array_inv!17023 (array!44386) Bool)

(assert (=> start!69942 (array_inv!17023 _keys!976)))

(assert (=> start!69942 true))

(declare-fun array_inv!17024 (array!44388) Bool)

(assert (=> start!69942 (and (array_inv!17024 _values!788) e!450449)))

(assert (=> start!69942 tp!43837))

(assert (= (and start!69942 res!555482) b!813022))

(assert (= (and b!813022 res!555481) b!813021))

(assert (= (and b!813021 res!555480) b!813025))

(assert (= (and b!813025 res!555483) b!813019))

(assert (= (and b!813020 condMapEmpty!22705) mapIsEmpty!22705))

(assert (= (and b!813020 (not condMapEmpty!22705)) mapNonEmpty!22705))

(get-info :version)

(assert (= (and mapNonEmpty!22705 ((_ is ValueCellFull!6627) mapValue!22705)) b!813024))

(assert (= (and b!813020 ((_ is ValueCellFull!6627) mapDefault!22705)) b!813023))

(assert (= start!69942 b!813020))

(declare-fun m!755201 () Bool)

(assert (=> mapNonEmpty!22705 m!755201))

(declare-fun m!755203 () Bool)

(assert (=> b!813021 m!755203))

(declare-fun m!755205 () Bool)

(assert (=> start!69942 m!755205))

(declare-fun m!755207 () Bool)

(assert (=> start!69942 m!755207))

(declare-fun m!755209 () Bool)

(assert (=> start!69942 m!755209))

(declare-fun m!755211 () Bool)

(assert (=> b!813019 m!755211))

(declare-fun m!755213 () Bool)

(assert (=> b!813025 m!755213))

(check-sat b_and!21143 (not mapNonEmpty!22705) tp_is_empty!14085 (not b_next!12375) (not b!813025) (not start!69942) (not b!813019) (not b!813021))
(check-sat b_and!21143 (not b_next!12375))
