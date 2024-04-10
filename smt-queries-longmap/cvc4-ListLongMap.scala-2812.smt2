; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40786 () Bool)

(assert start!40786)

(declare-fun b_free!10775 () Bool)

(declare-fun b_next!10775 () Bool)

(assert (=> start!40786 (= b_free!10775 (not b_next!10775))))

(declare-fun tp!38148 () Bool)

(declare-fun b_and!18837 () Bool)

(assert (=> start!40786 (= tp!38148 b_and!18837)))

(declare-fun b!452235 () Bool)

(declare-fun res!269342 () Bool)

(declare-fun e!264818 () Bool)

(assert (=> b!452235 (=> (not res!269342) (not e!264818))))

(declare-datatypes ((array!28033 0))(
  ( (array!28034 (arr!13461 (Array (_ BitVec 32) (_ BitVec 64))) (size!13813 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28033)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452235 (= res!269342 (or (= (select (arr!13461 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13461 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19806 () Bool)

(declare-fun mapRes!19806 () Bool)

(declare-fun tp!38147 () Bool)

(declare-fun e!264816 () Bool)

(assert (=> mapNonEmpty!19806 (= mapRes!19806 (and tp!38147 e!264816))))

(declare-datatypes ((V!17255 0))(
  ( (V!17256 (val!6101 Int)) )
))
(declare-datatypes ((ValueCell!5713 0))(
  ( (ValueCellFull!5713 (v!8360 V!17255)) (EmptyCell!5713) )
))
(declare-fun mapValue!19806 () ValueCell!5713)

(declare-datatypes ((array!28035 0))(
  ( (array!28036 (arr!13462 (Array (_ BitVec 32) ValueCell!5713)) (size!13814 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28035)

(declare-fun mapKey!19806 () (_ BitVec 32))

(declare-fun mapRest!19806 () (Array (_ BitVec 32) ValueCell!5713))

(assert (=> mapNonEmpty!19806 (= (arr!13462 _values!549) (store mapRest!19806 mapKey!19806 mapValue!19806))))

(declare-fun b!452237 () Bool)

(declare-fun e!264819 () Bool)

(assert (=> b!452237 (= e!264818 e!264819)))

(declare-fun res!269343 () Bool)

(assert (=> b!452237 (=> (not res!269343) (not e!264819))))

(declare-fun lt!205131 () array!28033)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28033 (_ BitVec 32)) Bool)

(assert (=> b!452237 (= res!269343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205131 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!452237 (= lt!205131 (array!28034 (store (arr!13461 _keys!709) i!563 k!794) (size!13813 _keys!709)))))

(declare-fun b!452238 () Bool)

(declare-fun e!264817 () Bool)

(assert (=> b!452238 (= e!264819 e!264817)))

(declare-fun res!269340 () Bool)

(assert (=> b!452238 (=> (not res!269340) (not e!264817))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!452238 (= res!269340 (= from!863 i!563))))

(declare-fun minValue!515 () V!17255)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17255)

(declare-fun lt!205129 () array!28035)

(declare-datatypes ((tuple2!8028 0))(
  ( (tuple2!8029 (_1!4025 (_ BitVec 64)) (_2!4025 V!17255)) )
))
(declare-datatypes ((List!8087 0))(
  ( (Nil!8084) (Cons!8083 (h!8939 tuple2!8028) (t!13885 List!8087)) )
))
(declare-datatypes ((ListLongMap!6941 0))(
  ( (ListLongMap!6942 (toList!3486 List!8087)) )
))
(declare-fun lt!205133 () ListLongMap!6941)

(declare-fun getCurrentListMapNoExtraKeys!1670 (array!28033 array!28035 (_ BitVec 32) (_ BitVec 32) V!17255 V!17255 (_ BitVec 32) Int) ListLongMap!6941)

(assert (=> b!452238 (= lt!205133 (getCurrentListMapNoExtraKeys!1670 lt!205131 lt!205129 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17255)

(assert (=> b!452238 (= lt!205129 (array!28036 (store (arr!13462 _values!549) i!563 (ValueCellFull!5713 v!412)) (size!13814 _values!549)))))

(declare-fun lt!205130 () ListLongMap!6941)

(assert (=> b!452238 (= lt!205130 (getCurrentListMapNoExtraKeys!1670 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452239 () Bool)

(declare-fun res!269347 () Bool)

(assert (=> b!452239 (=> (not res!269347) (not e!264818))))

(declare-datatypes ((List!8088 0))(
  ( (Nil!8085) (Cons!8084 (h!8940 (_ BitVec 64)) (t!13886 List!8088)) )
))
(declare-fun arrayNoDuplicates!0 (array!28033 (_ BitVec 32) List!8088) Bool)

(assert (=> b!452239 (= res!269347 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8085))))

(declare-fun b!452240 () Bool)

(declare-fun e!264823 () Bool)

(assert (=> b!452240 (= e!264823 (bvslt from!863 (size!13814 _values!549)))))

(declare-fun +!1563 (ListLongMap!6941 tuple2!8028) ListLongMap!6941)

(declare-fun get!6632 (ValueCell!5713 V!17255) V!17255)

(declare-fun dynLambda!863 (Int (_ BitVec 64)) V!17255)

(assert (=> b!452240 (= lt!205133 (+!1563 (getCurrentListMapNoExtraKeys!1670 lt!205131 lt!205129 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8029 (select (arr!13461 lt!205131) from!863) (get!6632 (select (arr!13462 lt!205129) from!863) (dynLambda!863 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!452241 () Bool)

(declare-fun res!269339 () Bool)

(assert (=> b!452241 (=> (not res!269339) (not e!264818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452241 (= res!269339 (validMask!0 mask!1025))))

(declare-fun b!452242 () Bool)

(declare-fun res!269348 () Bool)

(assert (=> b!452242 (=> (not res!269348) (not e!264818))))

(assert (=> b!452242 (= res!269348 (and (= (size!13814 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13813 _keys!709) (size!13814 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452243 () Bool)

(assert (=> b!452243 (= e!264817 (not e!264823))))

(declare-fun res!269338 () Bool)

(assert (=> b!452243 (=> res!269338 e!264823)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452243 (= res!269338 (validKeyInArray!0 (select (arr!13461 _keys!709) from!863)))))

(declare-fun e!264820 () Bool)

(assert (=> b!452243 e!264820))

(declare-fun c!56111 () Bool)

(assert (=> b!452243 (= c!56111 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13222 0))(
  ( (Unit!13223) )
))
(declare-fun lt!205132 () Unit!13222)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!726 (array!28033 array!28035 (_ BitVec 32) (_ BitVec 32) V!17255 V!17255 (_ BitVec 32) (_ BitVec 64) V!17255 (_ BitVec 32) Int) Unit!13222)

(assert (=> b!452243 (= lt!205132 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!726 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452244 () Bool)

(declare-fun res!269345 () Bool)

(assert (=> b!452244 (=> (not res!269345) (not e!264818))))

(declare-fun arrayContainsKey!0 (array!28033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452244 (= res!269345 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19806 () Bool)

(assert (=> mapIsEmpty!19806 mapRes!19806))

(declare-fun call!29939 () ListLongMap!6941)

(declare-fun bm!29935 () Bool)

(assert (=> bm!29935 (= call!29939 (getCurrentListMapNoExtraKeys!1670 (ite c!56111 _keys!709 lt!205131) (ite c!56111 _values!549 lt!205129) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452236 () Bool)

(declare-fun tp_is_empty!12113 () Bool)

(assert (=> b!452236 (= e!264816 tp_is_empty!12113)))

(declare-fun res!269344 () Bool)

(assert (=> start!40786 (=> (not res!269344) (not e!264818))))

(assert (=> start!40786 (= res!269344 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13813 _keys!709))))))

(assert (=> start!40786 e!264818))

(assert (=> start!40786 tp_is_empty!12113))

(assert (=> start!40786 tp!38148))

(assert (=> start!40786 true))

(declare-fun e!264824 () Bool)

(declare-fun array_inv!9746 (array!28035) Bool)

(assert (=> start!40786 (and (array_inv!9746 _values!549) e!264824)))

(declare-fun array_inv!9747 (array!28033) Bool)

(assert (=> start!40786 (array_inv!9747 _keys!709)))

(declare-fun b!452245 () Bool)

(declare-fun e!264822 () Bool)

(assert (=> b!452245 (= e!264822 tp_is_empty!12113)))

(declare-fun b!452246 () Bool)

(assert (=> b!452246 (= e!264824 (and e!264822 mapRes!19806))))

(declare-fun condMapEmpty!19806 () Bool)

(declare-fun mapDefault!19806 () ValueCell!5713)

