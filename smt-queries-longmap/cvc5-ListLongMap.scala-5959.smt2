; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77580 () Bool)

(assert start!77580)

(declare-fun b_free!16165 () Bool)

(declare-fun b_next!16165 () Bool)

(assert (=> start!77580 (= b_free!16165 (not b_next!16165))))

(declare-fun tp!56756 () Bool)

(declare-fun b_and!26531 () Bool)

(assert (=> start!77580 (= tp!56756 b_and!26531)))

(declare-fun b!904011 () Bool)

(declare-fun res!609933 () Bool)

(declare-fun e!506550 () Bool)

(assert (=> b!904011 (=> (not res!609933) (not e!506550))))

(declare-datatypes ((array!53218 0))(
  ( (array!53219 (arr!25568 (Array (_ BitVec 32) (_ BitVec 64))) (size!26027 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53218)

(declare-datatypes ((List!17955 0))(
  ( (Nil!17952) (Cons!17951 (h!19097 (_ BitVec 64)) (t!25338 List!17955)) )
))
(declare-fun arrayNoDuplicates!0 (array!53218 (_ BitVec 32) List!17955) Bool)

(assert (=> b!904011 (= res!609933 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17952))))

(declare-fun b!904012 () Bool)

(declare-fun res!609936 () Bool)

(assert (=> b!904012 (=> (not res!609936) (not e!506550))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53218 (_ BitVec 32)) Bool)

(assert (=> b!904012 (= res!609936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609934 () Bool)

(assert (=> start!77580 (=> (not res!609934) (not e!506550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77580 (= res!609934 (validMask!0 mask!1756))))

(assert (=> start!77580 e!506550))

(declare-datatypes ((V!29743 0))(
  ( (V!29744 (val!9342 Int)) )
))
(declare-datatypes ((ValueCell!8810 0))(
  ( (ValueCellFull!8810 (v!11847 V!29743)) (EmptyCell!8810) )
))
(declare-datatypes ((array!53220 0))(
  ( (array!53221 (arr!25569 (Array (_ BitVec 32) ValueCell!8810)) (size!26028 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53220)

(declare-fun e!506549 () Bool)

(declare-fun array_inv!20034 (array!53220) Bool)

(assert (=> start!77580 (and (array_inv!20034 _values!1152) e!506549)))

(assert (=> start!77580 tp!56756))

(assert (=> start!77580 true))

(declare-fun tp_is_empty!18583 () Bool)

(assert (=> start!77580 tp_is_empty!18583))

(declare-fun array_inv!20035 (array!53218) Bool)

(assert (=> start!77580 (array_inv!20035 _keys!1386)))

(declare-fun b!904013 () Bool)

(declare-fun e!506548 () Bool)

(assert (=> b!904013 (= e!506548 tp_is_empty!18583)))

(declare-fun b!904014 () Bool)

(declare-fun e!506544 () Bool)

(assert (=> b!904014 (= e!506544 tp_is_empty!18583)))

(declare-fun b!904015 () Bool)

(declare-fun res!609932 () Bool)

(assert (=> b!904015 (=> (not res!609932) (not e!506550))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29743)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29743)

(declare-datatypes ((tuple2!12136 0))(
  ( (tuple2!12137 (_1!6079 (_ BitVec 64)) (_2!6079 V!29743)) )
))
(declare-datatypes ((List!17956 0))(
  ( (Nil!17953) (Cons!17952 (h!19098 tuple2!12136) (t!25339 List!17956)) )
))
(declare-datatypes ((ListLongMap!10833 0))(
  ( (ListLongMap!10834 (toList!5432 List!17956)) )
))
(declare-fun contains!4480 (ListLongMap!10833 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2701 (array!53218 array!53220 (_ BitVec 32) (_ BitVec 32) V!29743 V!29743 (_ BitVec 32) Int) ListLongMap!10833)

(assert (=> b!904015 (= res!609932 (contains!4480 (getCurrentListMap!2701 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904016 () Bool)

(declare-fun e!506547 () Bool)

(assert (=> b!904016 (= e!506547 true)))

(declare-fun lt!408127 () V!29743)

(declare-fun lt!408128 () ListLongMap!10833)

(declare-fun apply!429 (ListLongMap!10833 (_ BitVec 64)) V!29743)

(assert (=> b!904016 (= lt!408127 (apply!429 lt!408128 k!1033))))

(declare-fun mapNonEmpty!29587 () Bool)

(declare-fun mapRes!29587 () Bool)

(declare-fun tp!56757 () Bool)

(assert (=> mapNonEmpty!29587 (= mapRes!29587 (and tp!56757 e!506548))))

(declare-fun mapKey!29587 () (_ BitVec 32))

(declare-fun mapRest!29587 () (Array (_ BitVec 32) ValueCell!8810))

(declare-fun mapValue!29587 () ValueCell!8810)

(assert (=> mapNonEmpty!29587 (= (arr!25569 _values!1152) (store mapRest!29587 mapKey!29587 mapValue!29587))))

(declare-fun b!904017 () Bool)

(declare-fun e!506546 () Bool)

(assert (=> b!904017 (= e!506550 (not e!506546))))

(declare-fun res!609938 () Bool)

(assert (=> b!904017 (=> res!609938 e!506546)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904017 (= res!609938 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26027 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904017 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30660 0))(
  ( (Unit!30661) )
))
(declare-fun lt!408129 () Unit!30660)

(declare-fun lemmaKeyInListMapIsInArray!173 (array!53218 array!53220 (_ BitVec 32) (_ BitVec 32) V!29743 V!29743 (_ BitVec 64) Int) Unit!30660)

(assert (=> b!904017 (= lt!408129 (lemmaKeyInListMapIsInArray!173 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904018 () Bool)

(declare-fun res!609931 () Bool)

(assert (=> b!904018 (=> (not res!609931) (not e!506550))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904018 (= res!609931 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29587 () Bool)

(assert (=> mapIsEmpty!29587 mapRes!29587))

(declare-fun b!904019 () Bool)

(assert (=> b!904019 (= e!506549 (and e!506544 mapRes!29587))))

(declare-fun condMapEmpty!29587 () Bool)

(declare-fun mapDefault!29587 () ValueCell!8810)

