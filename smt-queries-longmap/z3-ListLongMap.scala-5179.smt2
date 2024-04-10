; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70062 () Bool)

(assert start!70062)

(declare-fun b_free!12483 () Bool)

(declare-fun b_next!12483 () Bool)

(assert (=> start!70062 (= b_free!12483 (not b_next!12483))))

(declare-fun tp!44164 () Bool)

(declare-fun b_and!21255 () Bool)

(assert (=> start!70062 (= tp!44164 b_and!21255)))

(declare-fun res!556158 () Bool)

(declare-fun e!451308 () Bool)

(assert (=> start!70062 (=> (not res!556158) (not e!451308))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70062 (= res!556158 (validMask!0 mask!1312))))

(assert (=> start!70062 e!451308))

(declare-fun tp_is_empty!14193 () Bool)

(assert (=> start!70062 tp_is_empty!14193))

(declare-datatypes ((array!44590 0))(
  ( (array!44591 (arr!21355 (Array (_ BitVec 32) (_ BitVec 64))) (size!21776 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44590)

(declare-fun array_inv!17093 (array!44590) Bool)

(assert (=> start!70062 (array_inv!17093 _keys!976)))

(assert (=> start!70062 true))

(declare-datatypes ((V!23925 0))(
  ( (V!23926 (val!7144 Int)) )
))
(declare-datatypes ((ValueCell!6681 0))(
  ( (ValueCellFull!6681 (v!9571 V!23925)) (EmptyCell!6681) )
))
(declare-datatypes ((array!44592 0))(
  ( (array!44593 (arr!21356 (Array (_ BitVec 32) ValueCell!6681)) (size!21777 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44592)

(declare-fun e!451307 () Bool)

(declare-fun array_inv!17094 (array!44592) Bool)

(assert (=> start!70062 (and (array_inv!17094 _values!788) e!451307)))

(assert (=> start!70062 tp!44164))

(declare-fun mapIsEmpty!22870 () Bool)

(declare-fun mapRes!22870 () Bool)

(assert (=> mapIsEmpty!22870 mapRes!22870))

(declare-fun b!814226 () Bool)

(declare-fun res!556156 () Bool)

(assert (=> b!814226 (=> (not res!556156) (not e!451308))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814226 (= res!556156 (and (= (size!21777 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21776 _keys!976) (size!21777 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814227 () Bool)

(declare-fun e!451305 () Bool)

(assert (=> b!814227 (= e!451307 (and e!451305 mapRes!22870))))

(declare-fun condMapEmpty!22870 () Bool)

(declare-fun mapDefault!22870 () ValueCell!6681)

(assert (=> b!814227 (= condMapEmpty!22870 (= (arr!21356 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6681)) mapDefault!22870)))))

(declare-fun mapNonEmpty!22870 () Bool)

(declare-fun tp!44163 () Bool)

(declare-fun e!451304 () Bool)

(assert (=> mapNonEmpty!22870 (= mapRes!22870 (and tp!44163 e!451304))))

(declare-fun mapKey!22870 () (_ BitVec 32))

(declare-fun mapValue!22870 () ValueCell!6681)

(declare-fun mapRest!22870 () (Array (_ BitVec 32) ValueCell!6681))

(assert (=> mapNonEmpty!22870 (= (arr!21356 _values!788) (store mapRest!22870 mapKey!22870 mapValue!22870))))

(declare-fun b!814228 () Bool)

(declare-fun res!556157 () Bool)

(assert (=> b!814228 (=> (not res!556157) (not e!451308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44590 (_ BitVec 32)) Bool)

(assert (=> b!814228 (= res!556157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814229 () Bool)

(assert (=> b!814229 (= e!451308 (not true))))

(declare-datatypes ((tuple2!9364 0))(
  ( (tuple2!9365 (_1!4693 (_ BitVec 64)) (_2!4693 V!23925)) )
))
(declare-datatypes ((List!15195 0))(
  ( (Nil!15192) (Cons!15191 (h!16320 tuple2!9364) (t!21512 List!15195)) )
))
(declare-datatypes ((ListLongMap!8187 0))(
  ( (ListLongMap!8188 (toList!4109 List!15195)) )
))
(declare-fun lt!364526 () ListLongMap!8187)

(declare-fun lt!364525 () ListLongMap!8187)

(assert (=> b!814229 (= lt!364526 lt!364525)))

(declare-fun zeroValueBefore!34 () V!23925)

(declare-fun zeroValueAfter!34 () V!23925)

(declare-fun minValue!754 () V!23925)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27716 0))(
  ( (Unit!27717) )
))
(declare-fun lt!364527 () Unit!27716)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!269 (array!44590 array!44592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23925 V!23925 V!23925 V!23925 (_ BitVec 32) Int) Unit!27716)

(assert (=> b!814229 (= lt!364527 (lemmaNoChangeToArrayThenSameMapNoExtras!269 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2159 (array!44590 array!44592 (_ BitVec 32) (_ BitVec 32) V!23925 V!23925 (_ BitVec 32) Int) ListLongMap!8187)

(assert (=> b!814229 (= lt!364525 (getCurrentListMapNoExtraKeys!2159 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814229 (= lt!364526 (getCurrentListMapNoExtraKeys!2159 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814230 () Bool)

(declare-fun res!556155 () Bool)

(assert (=> b!814230 (=> (not res!556155) (not e!451308))))

(declare-datatypes ((List!15196 0))(
  ( (Nil!15193) (Cons!15192 (h!16321 (_ BitVec 64)) (t!21513 List!15196)) )
))
(declare-fun arrayNoDuplicates!0 (array!44590 (_ BitVec 32) List!15196) Bool)

(assert (=> b!814230 (= res!556155 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15193))))

(declare-fun b!814231 () Bool)

(assert (=> b!814231 (= e!451304 tp_is_empty!14193)))

(declare-fun b!814232 () Bool)

(assert (=> b!814232 (= e!451305 tp_is_empty!14193)))

(assert (= (and start!70062 res!556158) b!814226))

(assert (= (and b!814226 res!556156) b!814228))

(assert (= (and b!814228 res!556157) b!814230))

(assert (= (and b!814230 res!556155) b!814229))

(assert (= (and b!814227 condMapEmpty!22870) mapIsEmpty!22870))

(assert (= (and b!814227 (not condMapEmpty!22870)) mapNonEmpty!22870))

(get-info :version)

(assert (= (and mapNonEmpty!22870 ((_ is ValueCellFull!6681) mapValue!22870)) b!814231))

(assert (= (and b!814227 ((_ is ValueCellFull!6681) mapDefault!22870)) b!814232))

(assert (= start!70062 b!814227))

(declare-fun m!756071 () Bool)

(assert (=> b!814228 m!756071))

(declare-fun m!756073 () Bool)

(assert (=> b!814230 m!756073))

(declare-fun m!756075 () Bool)

(assert (=> mapNonEmpty!22870 m!756075))

(declare-fun m!756077 () Bool)

(assert (=> start!70062 m!756077))

(declare-fun m!756079 () Bool)

(assert (=> start!70062 m!756079))

(declare-fun m!756081 () Bool)

(assert (=> start!70062 m!756081))

(declare-fun m!756083 () Bool)

(assert (=> b!814229 m!756083))

(declare-fun m!756085 () Bool)

(assert (=> b!814229 m!756085))

(declare-fun m!756087 () Bool)

(assert (=> b!814229 m!756087))

(check-sat (not b!814229) tp_is_empty!14193 b_and!21255 (not start!70062) (not b!814230) (not mapNonEmpty!22870) (not b_next!12483) (not b!814228))
(check-sat b_and!21255 (not b_next!12483))
