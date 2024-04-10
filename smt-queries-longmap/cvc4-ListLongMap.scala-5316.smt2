; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71140 () Bool)

(assert start!71140)

(declare-fun b_free!13307 () Bool)

(declare-fun b_next!13307 () Bool)

(assert (=> start!71140 (= b_free!13307 (not b_next!13307))))

(declare-fun tp!46680 () Bool)

(declare-fun b_and!22233 () Bool)

(assert (=> start!71140 (= tp!46680 b_and!22233)))

(declare-fun b!826274 () Bool)

(declare-fun e!460069 () Bool)

(assert (=> b!826274 (= e!460069 true)))

(declare-datatypes ((V!25023 0))(
  ( (V!25024 (val!7556 Int)) )
))
(declare-datatypes ((tuple2!10010 0))(
  ( (tuple2!10011 (_1!5016 (_ BitVec 64)) (_2!5016 V!25023)) )
))
(declare-fun lt!373741 () tuple2!10010)

(declare-datatypes ((List!15809 0))(
  ( (Nil!15806) (Cons!15805 (h!16934 tuple2!10010) (t!22156 List!15809)) )
))
(declare-datatypes ((ListLongMap!8833 0))(
  ( (ListLongMap!8834 (toList!4432 List!15809)) )
))
(declare-fun lt!373740 () ListLongMap!8833)

(declare-fun lt!373736 () tuple2!10010)

(declare-fun lt!373733 () ListLongMap!8833)

(declare-fun +!1939 (ListLongMap!8833 tuple2!10010) ListLongMap!8833)

(assert (=> b!826274 (= lt!373740 (+!1939 (+!1939 lt!373733 lt!373736) lt!373741))))

(declare-fun lt!373742 () ListLongMap!8833)

(declare-fun lt!373734 () ListLongMap!8833)

(declare-fun lt!373737 () ListLongMap!8833)

(assert (=> b!826274 (and (= lt!373742 lt!373734) (= lt!373737 lt!373734) (= lt!373737 lt!373742))))

(declare-fun lt!373735 () ListLongMap!8833)

(assert (=> b!826274 (= lt!373734 (+!1939 lt!373735 lt!373736))))

(declare-fun lt!373732 () ListLongMap!8833)

(assert (=> b!826274 (= lt!373742 (+!1939 lt!373732 lt!373736))))

(declare-datatypes ((Unit!28327 0))(
  ( (Unit!28328) )
))
(declare-fun lt!373739 () Unit!28327)

(declare-fun zeroValueBefore!34 () V!25023)

(declare-fun zeroValueAfter!34 () V!25023)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!222 (ListLongMap!8833 (_ BitVec 64) V!25023 V!25023) Unit!28327)

(assert (=> b!826274 (= lt!373739 (addSameAsAddTwiceSameKeyDiffValues!222 lt!373732 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460074 () Bool)

(assert (=> b!826274 e!460074))

(declare-fun res!563242 () Bool)

(assert (=> b!826274 (=> (not res!563242) (not e!460074))))

(declare-fun lt!373744 () ListLongMap!8833)

(assert (=> b!826274 (= res!563242 (= lt!373744 lt!373735))))

(declare-fun lt!373743 () tuple2!10010)

(assert (=> b!826274 (= lt!373735 (+!1939 lt!373732 lt!373743))))

(assert (=> b!826274 (= lt!373732 (+!1939 lt!373733 lt!373741))))

(assert (=> b!826274 (= lt!373736 (tuple2!10011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460075 () Bool)

(assert (=> b!826274 e!460075))

(declare-fun res!563241 () Bool)

(assert (=> b!826274 (=> (not res!563241) (not e!460075))))

(assert (=> b!826274 (= res!563241 (= lt!373744 (+!1939 (+!1939 lt!373733 lt!373743) lt!373741)))))

(declare-fun minValue!754 () V!25023)

(assert (=> b!826274 (= lt!373741 (tuple2!10011 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826274 (= lt!373743 (tuple2!10011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46216 0))(
  ( (array!46217 (arr!22153 (Array (_ BitVec 32) (_ BitVec 64))) (size!22574 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46216)

(declare-datatypes ((ValueCell!7093 0))(
  ( (ValueCellFull!7093 (v!9990 V!25023)) (EmptyCell!7093) )
))
(declare-datatypes ((array!46218 0))(
  ( (array!46219 (arr!22154 (Array (_ BitVec 32) ValueCell!7093)) (size!22575 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46218)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2562 (array!46216 array!46218 (_ BitVec 32) (_ BitVec 32) V!25023 V!25023 (_ BitVec 32) Int) ListLongMap!8833)

(assert (=> b!826274 (= lt!373737 (getCurrentListMap!2562 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826274 (= lt!373744 (getCurrentListMap!2562 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826276 () Bool)

(declare-fun res!563243 () Bool)

(declare-fun e!460068 () Bool)

(assert (=> b!826276 (=> (not res!563243) (not e!460068))))

(declare-datatypes ((List!15810 0))(
  ( (Nil!15807) (Cons!15806 (h!16935 (_ BitVec 64)) (t!22157 List!15810)) )
))
(declare-fun arrayNoDuplicates!0 (array!46216 (_ BitVec 32) List!15810) Bool)

(assert (=> b!826276 (= res!563243 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15807))))

(declare-fun b!826277 () Bool)

(declare-fun res!563245 () Bool)

(assert (=> b!826277 (=> (not res!563245) (not e!460068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46216 (_ BitVec 32)) Bool)

(assert (=> b!826277 (= res!563245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun lt!373738 () ListLongMap!8833)

(declare-fun b!826278 () Bool)

(assert (=> b!826278 (= e!460074 (= lt!373737 (+!1939 (+!1939 lt!373738 lt!373741) lt!373736)))))

(declare-fun b!826279 () Bool)

(declare-fun e!460070 () Bool)

(declare-fun e!460073 () Bool)

(declare-fun mapRes!24151 () Bool)

(assert (=> b!826279 (= e!460070 (and e!460073 mapRes!24151))))

(declare-fun condMapEmpty!24151 () Bool)

(declare-fun mapDefault!24151 () ValueCell!7093)

