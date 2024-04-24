; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70616 () Bool)

(assert start!70616)

(declare-fun b_free!12793 () Bool)

(declare-fun b_next!12793 () Bool)

(assert (=> start!70616 (= b_free!12793 (not b_next!12793))))

(declare-fun tp!45108 () Bool)

(declare-fun b_and!21623 () Bool)

(assert (=> start!70616 (= tp!45108 b_and!21623)))

(declare-fun b!819225 () Bool)

(declare-fun e!454824 () Bool)

(declare-fun e!454820 () Bool)

(declare-fun mapRes!23350 () Bool)

(assert (=> b!819225 (= e!454824 (and e!454820 mapRes!23350))))

(declare-fun condMapEmpty!23350 () Bool)

(declare-datatypes ((V!24339 0))(
  ( (V!24340 (val!7299 Int)) )
))
(declare-datatypes ((ValueCell!6836 0))(
  ( (ValueCellFull!6836 (v!9728 V!24339)) (EmptyCell!6836) )
))
(declare-datatypes ((array!45205 0))(
  ( (array!45206 (arr!21653 (Array (_ BitVec 32) ValueCell!6836)) (size!22073 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45205)

(declare-fun mapDefault!23350 () ValueCell!6836)

(assert (=> b!819225 (= condMapEmpty!23350 (= (arr!21653 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6836)) mapDefault!23350)))))

(declare-fun b!819226 () Bool)

(declare-fun res!558848 () Bool)

(declare-fun e!454822 () Bool)

(assert (=> b!819226 (=> (not res!558848) (not e!454822))))

(declare-datatypes ((array!45207 0))(
  ( (array!45208 (arr!21654 (Array (_ BitVec 32) (_ BitVec 64))) (size!22074 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45207)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819226 (= res!558848 (and (= (size!22073 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22074 _keys!976) (size!22073 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819227 () Bool)

(declare-fun e!454819 () Bool)

(declare-fun tp_is_empty!14503 () Bool)

(assert (=> b!819227 (= e!454819 tp_is_empty!14503)))

(declare-fun mapNonEmpty!23350 () Bool)

(declare-fun tp!45109 () Bool)

(assert (=> mapNonEmpty!23350 (= mapRes!23350 (and tp!45109 e!454819))))

(declare-fun mapRest!23350 () (Array (_ BitVec 32) ValueCell!6836))

(declare-fun mapValue!23350 () ValueCell!6836)

(declare-fun mapKey!23350 () (_ BitVec 32))

(assert (=> mapNonEmpty!23350 (= (arr!21653 _values!788) (store mapRest!23350 mapKey!23350 mapValue!23350))))

(declare-fun res!558845 () Bool)

(assert (=> start!70616 (=> (not res!558845) (not e!454822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70616 (= res!558845 (validMask!0 mask!1312))))

(assert (=> start!70616 e!454822))

(assert (=> start!70616 tp_is_empty!14503))

(declare-fun array_inv!17343 (array!45207) Bool)

(assert (=> start!70616 (array_inv!17343 _keys!976)))

(assert (=> start!70616 true))

(declare-fun array_inv!17344 (array!45205) Bool)

(assert (=> start!70616 (and (array_inv!17344 _values!788) e!454824)))

(assert (=> start!70616 tp!45108))

(declare-fun b!819228 () Bool)

(assert (=> b!819228 (= e!454820 tp_is_empty!14503)))

(declare-fun b!819229 () Bool)

(declare-fun res!558846 () Bool)

(assert (=> b!819229 (=> (not res!558846) (not e!454822))))

(declare-datatypes ((List!15317 0))(
  ( (Nil!15314) (Cons!15313 (h!16448 (_ BitVec 64)) (t!21636 List!15317)) )
))
(declare-fun arrayNoDuplicates!0 (array!45207 (_ BitVec 32) List!15317) Bool)

(assert (=> b!819229 (= res!558846 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15314))))

(declare-fun mapIsEmpty!23350 () Bool)

(assert (=> mapIsEmpty!23350 mapRes!23350))

(declare-fun b!819230 () Bool)

(declare-fun e!454821 () Bool)

(assert (=> b!819230 (= e!454822 (not e!454821))))

(declare-fun res!558849 () Bool)

(assert (=> b!819230 (=> res!558849 e!454821)))

(assert (=> b!819230 (= res!558849 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9506 0))(
  ( (tuple2!9507 (_1!4764 (_ BitVec 64)) (_2!4764 V!24339)) )
))
(declare-datatypes ((List!15318 0))(
  ( (Nil!15315) (Cons!15314 (h!16449 tuple2!9506) (t!21637 List!15318)) )
))
(declare-datatypes ((ListLongMap!8331 0))(
  ( (ListLongMap!8332 (toList!4181 List!15318)) )
))
(declare-fun lt!367030 () ListLongMap!8331)

(declare-fun lt!367029 () ListLongMap!8331)

(assert (=> b!819230 (= lt!367030 lt!367029)))

(declare-fun zeroValueBefore!34 () V!24339)

(declare-fun zeroValueAfter!34 () V!24339)

(declare-fun minValue!754 () V!24339)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27913 0))(
  ( (Unit!27914) )
))
(declare-fun lt!367028 () Unit!27913)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!366 (array!45207 array!45205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24339 V!24339 V!24339 V!24339 (_ BitVec 32) Int) Unit!27913)

(assert (=> b!819230 (= lt!367028 (lemmaNoChangeToArrayThenSameMapNoExtras!366 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2278 (array!45207 array!45205 (_ BitVec 32) (_ BitVec 32) V!24339 V!24339 (_ BitVec 32) Int) ListLongMap!8331)

(assert (=> b!819230 (= lt!367029 (getCurrentListMapNoExtraKeys!2278 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819230 (= lt!367030 (getCurrentListMapNoExtraKeys!2278 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819231 () Bool)

(declare-fun res!558847 () Bool)

(assert (=> b!819231 (=> (not res!558847) (not e!454822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45207 (_ BitVec 32)) Bool)

(assert (=> b!819231 (= res!558847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819232 () Bool)

(assert (=> b!819232 (= e!454821 true)))

(declare-fun lt!367027 () ListLongMap!8331)

(declare-fun getCurrentListMap!2376 (array!45207 array!45205 (_ BitVec 32) (_ BitVec 32) V!24339 V!24339 (_ BitVec 32) Int) ListLongMap!8331)

(assert (=> b!819232 (= lt!367027 (getCurrentListMap!2376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70616 res!558845) b!819226))

(assert (= (and b!819226 res!558848) b!819231))

(assert (= (and b!819231 res!558847) b!819229))

(assert (= (and b!819229 res!558846) b!819230))

(assert (= (and b!819230 (not res!558849)) b!819232))

(assert (= (and b!819225 condMapEmpty!23350) mapIsEmpty!23350))

(assert (= (and b!819225 (not condMapEmpty!23350)) mapNonEmpty!23350))

(get-info :version)

(assert (= (and mapNonEmpty!23350 ((_ is ValueCellFull!6836) mapValue!23350)) b!819227))

(assert (= (and b!819225 ((_ is ValueCellFull!6836) mapDefault!23350)) b!819228))

(assert (= start!70616 b!819225))

(declare-fun m!761047 () Bool)

(assert (=> mapNonEmpty!23350 m!761047))

(declare-fun m!761049 () Bool)

(assert (=> b!819229 m!761049))

(declare-fun m!761051 () Bool)

(assert (=> b!819231 m!761051))

(declare-fun m!761053 () Bool)

(assert (=> b!819232 m!761053))

(declare-fun m!761055 () Bool)

(assert (=> start!70616 m!761055))

(declare-fun m!761057 () Bool)

(assert (=> start!70616 m!761057))

(declare-fun m!761059 () Bool)

(assert (=> start!70616 m!761059))

(declare-fun m!761061 () Bool)

(assert (=> b!819230 m!761061))

(declare-fun m!761063 () Bool)

(assert (=> b!819230 m!761063))

(declare-fun m!761065 () Bool)

(assert (=> b!819230 m!761065))

(check-sat (not b_next!12793) (not mapNonEmpty!23350) tp_is_empty!14503 (not start!70616) (not b!819232) (not b!819230) (not b!819231) b_and!21623 (not b!819229))
(check-sat b_and!21623 (not b_next!12793))
