; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79368 () Bool)

(assert start!79368)

(declare-fun b_free!17555 () Bool)

(declare-fun b_next!17555 () Bool)

(assert (=> start!79368 (= b_free!17555 (not b_next!17555))))

(declare-fun tp!61109 () Bool)

(declare-fun b_and!28669 () Bool)

(assert (=> start!79368 (= tp!61109 b_and!28669)))

(declare-fun b!932363 () Bool)

(declare-fun e!523590 () Bool)

(declare-fun tp_is_empty!20063 () Bool)

(assert (=> b!932363 (= e!523590 tp_is_empty!20063)))

(declare-fun b!932364 () Bool)

(declare-fun res!627934 () Bool)

(declare-fun e!523591 () Bool)

(assert (=> b!932364 (=> (not res!627934) (not e!523591))))

(declare-datatypes ((array!56066 0))(
  ( (array!56067 (arr!26977 (Array (_ BitVec 32) (_ BitVec 64))) (size!27436 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56066)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56066 (_ BitVec 32)) Bool)

(assert (=> b!932364 (= res!627934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932365 () Bool)

(declare-fun res!627929 () Bool)

(assert (=> b!932365 (=> (not res!627929) (not e!523591))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31715 0))(
  ( (V!31716 (val!10082 Int)) )
))
(declare-datatypes ((ValueCell!9550 0))(
  ( (ValueCellFull!9550 (v!12601 V!31715)) (EmptyCell!9550) )
))
(declare-datatypes ((array!56068 0))(
  ( (array!56069 (arr!26978 (Array (_ BitVec 32) ValueCell!9550)) (size!27437 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56068)

(assert (=> b!932365 (= res!627929 (and (= (size!27437 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27436 _keys!1487) (size!27437 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932366 () Bool)

(declare-fun res!627930 () Bool)

(declare-fun e!523595 () Bool)

(assert (=> b!932366 (=> (not res!627930) (not e!523595))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31715)

(declare-datatypes ((tuple2!13208 0))(
  ( (tuple2!13209 (_1!6615 (_ BitVec 64)) (_2!6615 V!31715)) )
))
(declare-datatypes ((List!18993 0))(
  ( (Nil!18990) (Cons!18989 (h!20135 tuple2!13208) (t!27092 List!18993)) )
))
(declare-datatypes ((ListLongMap!11905 0))(
  ( (ListLongMap!11906 (toList!5968 List!18993)) )
))
(declare-fun lt!419860 () ListLongMap!11905)

(declare-fun apply!782 (ListLongMap!11905 (_ BitVec 64)) V!31715)

(assert (=> b!932366 (= res!627930 (= (apply!782 lt!419860 k!1099) v!791))))

(declare-fun mapIsEmpty!31854 () Bool)

(declare-fun mapRes!31854 () Bool)

(assert (=> mapIsEmpty!31854 mapRes!31854))

(declare-fun res!627926 () Bool)

(assert (=> start!79368 (=> (not res!627926) (not e!523591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79368 (= res!627926 (validMask!0 mask!1881))))

(assert (=> start!79368 e!523591))

(assert (=> start!79368 true))

(assert (=> start!79368 tp_is_empty!20063))

(declare-fun e!523592 () Bool)

(declare-fun array_inv!21000 (array!56068) Bool)

(assert (=> start!79368 (and (array_inv!21000 _values!1231) e!523592)))

(assert (=> start!79368 tp!61109))

(declare-fun array_inv!21001 (array!56066) Bool)

(assert (=> start!79368 (array_inv!21001 _keys!1487)))

(declare-fun b!932367 () Bool)

(declare-fun res!627931 () Bool)

(assert (=> b!932367 (=> (not res!627931) (not e!523595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932367 (= res!627931 (validKeyInArray!0 k!1099))))

(declare-fun b!932368 () Bool)

(assert (=> b!932368 (= e!523591 e!523595)))

(declare-fun res!627932 () Bool)

(assert (=> b!932368 (=> (not res!627932) (not e!523595))))

(declare-fun contains!5017 (ListLongMap!11905 (_ BitVec 64)) Bool)

(assert (=> b!932368 (= res!627932 (contains!5017 lt!419860 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31715)

(declare-fun minValue!1173 () V!31715)

(declare-fun getCurrentListMap!3206 (array!56066 array!56068 (_ BitVec 32) (_ BitVec 32) V!31715 V!31715 (_ BitVec 32) Int) ListLongMap!11905)

(assert (=> b!932368 (= lt!419860 (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932369 () Bool)

(declare-fun res!627927 () Bool)

(assert (=> b!932369 (=> (not res!627927) (not e!523595))))

(assert (=> b!932369 (= res!627927 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932370 () Bool)

(declare-fun e!523596 () Bool)

(assert (=> b!932370 (= e!523595 e!523596)))

(declare-fun res!627928 () Bool)

(assert (=> b!932370 (=> (not res!627928) (not e!523596))))

(declare-fun lt!419864 () (_ BitVec 64))

(assert (=> b!932370 (= res!627928 (validKeyInArray!0 lt!419864))))

(assert (=> b!932370 (= lt!419864 (select (arr!26977 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932371 () Bool)

(assert (=> b!932371 (= e!523596 (not (or (bvsge (size!27436 _keys!1487) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!27436 _keys!1487)) (bvsle (bvsub from!1844 #b00000000000000000000000000000001) (size!27436 _keys!1487)))))))

(declare-fun lt!419861 () tuple2!13208)

(declare-fun +!2774 (ListLongMap!11905 tuple2!13208) ListLongMap!11905)

(assert (=> b!932371 (contains!5017 (+!2774 lt!419860 lt!419861) k!1099)))

(declare-datatypes ((Unit!31463 0))(
  ( (Unit!31464) )
))
(declare-fun lt!419859 () Unit!31463)

(declare-fun lt!419862 () V!31715)

(declare-fun addStillContains!493 (ListLongMap!11905 (_ BitVec 64) V!31715 (_ BitVec 64)) Unit!31463)

(assert (=> b!932371 (= lt!419859 (addStillContains!493 lt!419860 lt!419864 lt!419862 k!1099))))

(assert (=> b!932371 (= (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2774 (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419861))))

(assert (=> b!932371 (= lt!419861 (tuple2!13209 lt!419864 lt!419862))))

(declare-fun get!14184 (ValueCell!9550 V!31715) V!31715)

(declare-fun dynLambda!1563 (Int (_ BitVec 64)) V!31715)

(assert (=> b!932371 (= lt!419862 (get!14184 (select (arr!26978 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1563 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419863 () Unit!31463)

(declare-fun lemmaListMapRecursiveValidKeyArray!164 (array!56066 array!56068 (_ BitVec 32) (_ BitVec 32) V!31715 V!31715 (_ BitVec 32) Int) Unit!31463)

(assert (=> b!932371 (= lt!419863 (lemmaListMapRecursiveValidKeyArray!164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932372 () Bool)

(declare-fun e!523594 () Bool)

(assert (=> b!932372 (= e!523594 tp_is_empty!20063)))

(declare-fun b!932373 () Bool)

(assert (=> b!932373 (= e!523592 (and e!523590 mapRes!31854))))

(declare-fun condMapEmpty!31854 () Bool)

(declare-fun mapDefault!31854 () ValueCell!9550)

