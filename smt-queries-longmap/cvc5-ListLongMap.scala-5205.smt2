; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70244 () Bool)

(assert start!70244)

(declare-fun b_free!12637 () Bool)

(declare-fun b_next!12637 () Bool)

(assert (=> start!70244 (= b_free!12637 (not b_next!12637))))

(declare-fun tp!44631 () Bool)

(declare-fun b_and!21425 () Bool)

(assert (=> start!70244 (= tp!44631 b_and!21425)))

(declare-fun b!816089 () Bool)

(declare-fun res!557217 () Bool)

(declare-fun e!452645 () Bool)

(assert (=> b!816089 (=> res!557217 e!452645)))

(declare-datatypes ((V!24131 0))(
  ( (V!24132 (val!7221 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24131)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24131)

(declare-fun minValue!754 () V!24131)

(declare-datatypes ((ValueCell!6758 0))(
  ( (ValueCellFull!6758 (v!9648 V!24131)) (EmptyCell!6758) )
))
(declare-datatypes ((array!44894 0))(
  ( (array!44895 (arr!21505 (Array (_ BitVec 32) ValueCell!6758)) (size!21926 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44894)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!44896 0))(
  ( (array!44897 (arr!21506 (Array (_ BitVec 32) (_ BitVec 64))) (size!21927 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44896)

(declare-datatypes ((tuple2!9482 0))(
  ( (tuple2!9483 (_1!4752 (_ BitVec 64)) (_2!4752 V!24131)) )
))
(declare-datatypes ((List!15312 0))(
  ( (Nil!15309) (Cons!15308 (h!16437 tuple2!9482) (t!21633 List!15312)) )
))
(declare-datatypes ((ListLongMap!8305 0))(
  ( (ListLongMap!8306 (toList!4168 List!15312)) )
))
(declare-fun +!1801 (ListLongMap!8305 tuple2!9482) ListLongMap!8305)

(declare-fun getCurrentListMap!2395 (array!44896 array!44894 (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 (_ BitVec 32) Int) ListLongMap!8305)

(assert (=> b!816089 (= res!557217 (not (= (+!1801 (getCurrentListMap!2395 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2395 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(declare-fun b!816090 () Bool)

(declare-fun e!452647 () Bool)

(assert (=> b!816090 (= e!452647 (not e!452645))))

(declare-fun res!557221 () Bool)

(assert (=> b!816090 (=> res!557221 e!452645)))

(assert (=> b!816090 (= res!557221 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365444 () ListLongMap!8305)

(declare-fun lt!365443 () ListLongMap!8305)

(assert (=> b!816090 (= lt!365444 lt!365443)))

(declare-datatypes ((Unit!27824 0))(
  ( (Unit!27825) )
))
(declare-fun lt!365442 () Unit!27824)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!323 (array!44896 array!44894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 V!24131 V!24131 (_ BitVec 32) Int) Unit!27824)

(assert (=> b!816090 (= lt!365442 (lemmaNoChangeToArrayThenSameMapNoExtras!323 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2213 (array!44896 array!44894 (_ BitVec 32) (_ BitVec 32) V!24131 V!24131 (_ BitVec 32) Int) ListLongMap!8305)

(assert (=> b!816090 (= lt!365443 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816090 (= lt!365444 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816091 () Bool)

(declare-fun res!557220 () Bool)

(assert (=> b!816091 (=> (not res!557220) (not e!452647))))

(declare-datatypes ((List!15313 0))(
  ( (Nil!15310) (Cons!15309 (h!16438 (_ BitVec 64)) (t!21634 List!15313)) )
))
(declare-fun arrayNoDuplicates!0 (array!44896 (_ BitVec 32) List!15313) Bool)

(assert (=> b!816091 (= res!557220 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15310))))

(declare-fun mapIsEmpty!23107 () Bool)

(declare-fun mapRes!23107 () Bool)

(assert (=> mapIsEmpty!23107 mapRes!23107))

(declare-fun b!816092 () Bool)

(declare-fun e!452646 () Bool)

(declare-fun tp_is_empty!14347 () Bool)

(assert (=> b!816092 (= e!452646 tp_is_empty!14347)))

(declare-fun b!816093 () Bool)

(declare-fun res!557219 () Bool)

(assert (=> b!816093 (=> (not res!557219) (not e!452647))))

(assert (=> b!816093 (= res!557219 (and (= (size!21926 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21927 _keys!976) (size!21926 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816094 () Bool)

(assert (=> b!816094 (= e!452645 (bvsle #b00000000000000000000000000000000 (size!21927 _keys!976)))))

(declare-fun res!557218 () Bool)

(assert (=> start!70244 (=> (not res!557218) (not e!452647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70244 (= res!557218 (validMask!0 mask!1312))))

(assert (=> start!70244 e!452647))

(assert (=> start!70244 tp_is_empty!14347))

(declare-fun array_inv!17207 (array!44896) Bool)

(assert (=> start!70244 (array_inv!17207 _keys!976)))

(assert (=> start!70244 true))

(declare-fun e!452644 () Bool)

(declare-fun array_inv!17208 (array!44894) Bool)

(assert (=> start!70244 (and (array_inv!17208 _values!788) e!452644)))

(assert (=> start!70244 tp!44631))

(declare-fun b!816095 () Bool)

(declare-fun e!452643 () Bool)

(assert (=> b!816095 (= e!452643 tp_is_empty!14347)))

(declare-fun b!816096 () Bool)

(declare-fun res!557222 () Bool)

(assert (=> b!816096 (=> (not res!557222) (not e!452647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44896 (_ BitVec 32)) Bool)

(assert (=> b!816096 (= res!557222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816097 () Bool)

(assert (=> b!816097 (= e!452644 (and e!452646 mapRes!23107))))

(declare-fun condMapEmpty!23107 () Bool)

(declare-fun mapDefault!23107 () ValueCell!6758)

