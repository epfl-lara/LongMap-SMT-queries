; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20590 () Bool)

(assert start!20590)

(declare-fun b_free!5249 () Bool)

(declare-fun b_next!5249 () Bool)

(assert (=> start!20590 (= b_free!5249 (not b_next!5249))))

(declare-fun tp!18779 () Bool)

(declare-fun b_and!11995 () Bool)

(assert (=> start!20590 (= tp!18779 b_and!11995)))

(declare-fun b!205128 () Bool)

(declare-fun e!134166 () Bool)

(declare-fun e!134163 () Bool)

(assert (=> b!205128 (= e!134166 (not e!134163))))

(declare-fun res!99030 () Bool)

(assert (=> b!205128 (=> res!99030 e!134163)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205128 (= res!99030 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6453 0))(
  ( (V!6454 (val!2597 Int)) )
))
(declare-datatypes ((tuple2!3936 0))(
  ( (tuple2!3937 (_1!1979 (_ BitVec 64)) (_2!1979 V!6453)) )
))
(declare-datatypes ((List!2836 0))(
  ( (Nil!2833) (Cons!2832 (h!3474 tuple2!3936) (t!7767 List!2836)) )
))
(declare-datatypes ((ListLongMap!2849 0))(
  ( (ListLongMap!2850 (toList!1440 List!2836)) )
))
(declare-fun lt!104268 () ListLongMap!2849)

(declare-datatypes ((ValueCell!2209 0))(
  ( (ValueCellFull!2209 (v!4567 V!6453)) (EmptyCell!2209) )
))
(declare-datatypes ((array!9423 0))(
  ( (array!9424 (arr!4462 (Array (_ BitVec 32) ValueCell!2209)) (size!4787 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9423)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6453)

(declare-datatypes ((array!9425 0))(
  ( (array!9426 (arr!4463 (Array (_ BitVec 32) (_ BitVec 64))) (size!4788 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9425)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6453)

(declare-fun getCurrentListMap!1012 (array!9425 array!9423 (_ BitVec 32) (_ BitVec 32) V!6453 V!6453 (_ BitVec 32) Int) ListLongMap!2849)

(assert (=> b!205128 (= lt!104268 (getCurrentListMap!1012 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104260 () ListLongMap!2849)

(declare-fun lt!104267 () array!9423)

(assert (=> b!205128 (= lt!104260 (getCurrentListMap!1012 _keys!825 lt!104267 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104266 () ListLongMap!2849)

(declare-fun lt!104271 () ListLongMap!2849)

(assert (=> b!205128 (and (= lt!104266 lt!104271) (= lt!104271 lt!104266))))

(declare-fun lt!104263 () ListLongMap!2849)

(declare-fun lt!104264 () tuple2!3936)

(declare-fun +!467 (ListLongMap!2849 tuple2!3936) ListLongMap!2849)

(assert (=> b!205128 (= lt!104271 (+!467 lt!104263 lt!104264))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6453)

(assert (=> b!205128 (= lt!104264 (tuple2!3937 k!843 v!520))))

(declare-datatypes ((Unit!6226 0))(
  ( (Unit!6227) )
))
(declare-fun lt!104269 () Unit!6226)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!125 (array!9425 array!9423 (_ BitVec 32) (_ BitVec 32) V!6453 V!6453 (_ BitVec 32) (_ BitVec 64) V!6453 (_ BitVec 32) Int) Unit!6226)

(assert (=> b!205128 (= lt!104269 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!125 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!386 (array!9425 array!9423 (_ BitVec 32) (_ BitVec 32) V!6453 V!6453 (_ BitVec 32) Int) ListLongMap!2849)

(assert (=> b!205128 (= lt!104266 (getCurrentListMapNoExtraKeys!386 _keys!825 lt!104267 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205128 (= lt!104267 (array!9424 (store (arr!4462 _values!649) i!601 (ValueCellFull!2209 v!520)) (size!4787 _values!649)))))

(assert (=> b!205128 (= lt!104263 (getCurrentListMapNoExtraKeys!386 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205129 () Bool)

(declare-fun e!134164 () Bool)

(assert (=> b!205129 (= e!134163 e!134164)))

(declare-fun res!99029 () Bool)

(assert (=> b!205129 (=> res!99029 e!134164)))

(assert (=> b!205129 (= res!99029 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104262 () ListLongMap!2849)

(assert (=> b!205129 (= lt!104268 lt!104262)))

(declare-fun lt!104265 () tuple2!3936)

(assert (=> b!205129 (= lt!104262 (+!467 lt!104263 lt!104265))))

(declare-fun lt!104270 () ListLongMap!2849)

(assert (=> b!205129 (= lt!104260 lt!104270)))

(assert (=> b!205129 (= lt!104270 (+!467 lt!104271 lt!104265))))

(assert (=> b!205129 (= lt!104260 (+!467 lt!104266 lt!104265))))

(assert (=> b!205129 (= lt!104265 (tuple2!3937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205130 () Bool)

(declare-fun res!99031 () Bool)

(assert (=> b!205130 (=> (not res!99031) (not e!134166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9425 (_ BitVec 32)) Bool)

(assert (=> b!205130 (= res!99031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205131 () Bool)

(declare-fun res!99023 () Bool)

(assert (=> b!205131 (=> (not res!99023) (not e!134166))))

(assert (=> b!205131 (= res!99023 (= (select (arr!4463 _keys!825) i!601) k!843))))

(declare-fun b!205132 () Bool)

(declare-fun res!99024 () Bool)

(assert (=> b!205132 (=> (not res!99024) (not e!134166))))

(assert (=> b!205132 (= res!99024 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4788 _keys!825))))))

(declare-fun b!205133 () Bool)

(declare-fun res!99027 () Bool)

(assert (=> b!205133 (=> (not res!99027) (not e!134166))))

(assert (=> b!205133 (= res!99027 (and (= (size!4787 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4788 _keys!825) (size!4787 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8726 () Bool)

(declare-fun mapRes!8726 () Bool)

(assert (=> mapIsEmpty!8726 mapRes!8726))

(declare-fun res!99026 () Bool)

(assert (=> start!20590 (=> (not res!99026) (not e!134166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20590 (= res!99026 (validMask!0 mask!1149))))

(assert (=> start!20590 e!134166))

(declare-fun e!134167 () Bool)

(declare-fun array_inv!2947 (array!9423) Bool)

(assert (=> start!20590 (and (array_inv!2947 _values!649) e!134167)))

(assert (=> start!20590 true))

(declare-fun tp_is_empty!5105 () Bool)

(assert (=> start!20590 tp_is_empty!5105))

(declare-fun array_inv!2948 (array!9425) Bool)

(assert (=> start!20590 (array_inv!2948 _keys!825)))

(assert (=> start!20590 tp!18779))

(declare-fun b!205134 () Bool)

(declare-fun e!134165 () Bool)

(assert (=> b!205134 (= e!134165 tp_is_empty!5105)))

(declare-fun b!205135 () Bool)

(declare-fun e!134162 () Bool)

(assert (=> b!205135 (= e!134162 tp_is_empty!5105)))

(declare-fun b!205136 () Bool)

(assert (=> b!205136 (= e!134167 (and e!134165 mapRes!8726))))

(declare-fun condMapEmpty!8726 () Bool)

(declare-fun mapDefault!8726 () ValueCell!2209)

