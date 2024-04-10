; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77706 () Bool)

(assert start!77706)

(declare-fun b_free!16291 () Bool)

(declare-fun b_next!16291 () Bool)

(assert (=> start!77706 (= b_free!16291 (not b_next!16291))))

(declare-fun tp!57134 () Bool)

(declare-fun b_and!26735 () Bool)

(assert (=> start!77706 (= tp!57134 b_and!26735)))

(declare-fun b!906476 () Bool)

(declare-fun e!507989 () Bool)

(declare-fun tp_is_empty!18709 () Bool)

(assert (=> b!906476 (= e!507989 tp_is_empty!18709)))

(declare-fun b!906477 () Bool)

(declare-fun res!611757 () Bool)

(declare-fun e!507993 () Bool)

(assert (=> b!906477 (=> res!611757 e!507993)))

(declare-datatypes ((V!29911 0))(
  ( (V!29912 (val!9405 Int)) )
))
(declare-fun lt!408933 () V!29911)

(declare-datatypes ((tuple2!12242 0))(
  ( (tuple2!12243 (_1!6132 (_ BitVec 64)) (_2!6132 V!29911)) )
))
(declare-datatypes ((List!18048 0))(
  ( (Nil!18045) (Cons!18044 (h!19190 tuple2!12242) (t!25511 List!18048)) )
))
(declare-datatypes ((ListLongMap!10939 0))(
  ( (ListLongMap!10940 (toList!5485 List!18048)) )
))
(declare-fun lt!408936 () ListLongMap!10939)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!471 (ListLongMap!10939 (_ BitVec 64)) V!29911)

(assert (=> b!906477 (= res!611757 (not (= (apply!471 lt!408936 k!1033) lt!408933)))))

(declare-fun mapIsEmpty!29776 () Bool)

(declare-fun mapRes!29776 () Bool)

(assert (=> mapIsEmpty!29776 mapRes!29776))

(declare-fun mapNonEmpty!29776 () Bool)

(declare-fun tp!57135 () Bool)

(declare-fun e!507990 () Bool)

(assert (=> mapNonEmpty!29776 (= mapRes!29776 (and tp!57135 e!507990))))

(declare-datatypes ((ValueCell!8873 0))(
  ( (ValueCellFull!8873 (v!11910 V!29911)) (EmptyCell!8873) )
))
(declare-datatypes ((array!53460 0))(
  ( (array!53461 (arr!25689 (Array (_ BitVec 32) ValueCell!8873)) (size!26148 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53460)

(declare-fun mapRest!29776 () (Array (_ BitVec 32) ValueCell!8873))

(declare-fun mapKey!29776 () (_ BitVec 32))

(declare-fun mapValue!29776 () ValueCell!8873)

(assert (=> mapNonEmpty!29776 (= (arr!25689 _values!1152) (store mapRest!29776 mapKey!29776 mapValue!29776))))

(declare-fun b!906478 () Bool)

(declare-fun res!611755 () Bool)

(declare-fun e!507992 () Bool)

(assert (=> b!906478 (=> (not res!611755) (not e!507992))))

(declare-datatypes ((array!53462 0))(
  ( (array!53463 (arr!25690 (Array (_ BitVec 32) (_ BitVec 64))) (size!26149 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53462)

(declare-datatypes ((List!18049 0))(
  ( (Nil!18046) (Cons!18045 (h!19191 (_ BitVec 64)) (t!25512 List!18049)) )
))
(declare-fun arrayNoDuplicates!0 (array!53462 (_ BitVec 32) List!18049) Bool)

(assert (=> b!906478 (= res!611755 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18046))))

(declare-fun b!906479 () Bool)

(declare-fun e!507986 () Bool)

(assert (=> b!906479 (= e!507986 e!507993)))

(declare-fun res!611752 () Bool)

(assert (=> b!906479 (=> res!611752 e!507993)))

(declare-fun contains!4530 (ListLongMap!10939 (_ BitVec 64)) Bool)

(assert (=> b!906479 (= res!611752 (not (contains!4530 lt!408936 k!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29911)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29911)

(declare-fun getCurrentListMap!2751 (array!53462 array!53460 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 32) Int) ListLongMap!10939)

(assert (=> b!906479 (= lt!408936 (getCurrentListMap!2751 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906480 () Bool)

(assert (=> b!906480 (= e!507993 true)))

(declare-fun lt!408935 () ListLongMap!10939)

(assert (=> b!906480 (= (apply!471 lt!408935 k!1033) lt!408933)))

(declare-datatypes ((Unit!30764 0))(
  ( (Unit!30765) )
))
(declare-fun lt!408934 () Unit!30764)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!26 (array!53462 array!53460 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 64) V!29911 (_ BitVec 32) Int) Unit!30764)

(assert (=> b!906480 (= lt!408934 (lemmaListMapApplyFromThenApplyFromZero!26 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408933 i!717 defaultEntry!1160))))

(declare-fun b!906482 () Bool)

(declare-fun res!611758 () Bool)

(declare-fun e!507991 () Bool)

(assert (=> b!906482 (=> (not res!611758) (not e!507991))))

(assert (=> b!906482 (= res!611758 (and (= (select (arr!25690 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906483 () Bool)

(assert (=> b!906483 (= e!507992 e!507991)))

(declare-fun res!611751 () Bool)

(assert (=> b!906483 (=> (not res!611751) (not e!507991))))

(assert (=> b!906483 (= res!611751 (contains!4530 lt!408935 k!1033))))

(assert (=> b!906483 (= lt!408935 (getCurrentListMap!2751 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906484 () Bool)

(assert (=> b!906484 (= e!507991 (not e!507986))))

(declare-fun res!611750 () Bool)

(assert (=> b!906484 (=> res!611750 e!507986)))

(assert (=> b!906484 (= res!611750 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26149 _keys!1386))))))

(declare-fun get!13506 (ValueCell!8873 V!29911) V!29911)

(declare-fun dynLambda!1348 (Int (_ BitVec 64)) V!29911)

(assert (=> b!906484 (= lt!408933 (get!13506 (select (arr!25689 _values!1152) i!717) (dynLambda!1348 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906484 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408932 () Unit!30764)

(declare-fun lemmaKeyInListMapIsInArray!220 (array!53462 array!53460 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 64) Int) Unit!30764)

(assert (=> b!906484 (= lt!408932 (lemmaKeyInListMapIsInArray!220 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906485 () Bool)

(declare-fun res!611753 () Bool)

(assert (=> b!906485 (=> (not res!611753) (not e!507991))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906485 (= res!611753 (inRange!0 i!717 mask!1756))))

(declare-fun b!906486 () Bool)

(declare-fun e!507988 () Bool)

(assert (=> b!906486 (= e!507988 (and e!507989 mapRes!29776))))

(declare-fun condMapEmpty!29776 () Bool)

(declare-fun mapDefault!29776 () ValueCell!8873)

