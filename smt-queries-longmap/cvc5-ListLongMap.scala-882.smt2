; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20388 () Bool)

(assert start!20388)

(declare-fun b_free!5047 () Bool)

(declare-fun b_next!5047 () Bool)

(assert (=> start!20388 (= b_free!5047 (not b_next!5047))))

(declare-fun tp!18173 () Bool)

(declare-fun b_and!11793 () Bool)

(assert (=> start!20388 (= tp!18173 b_and!11793)))

(declare-fun b!201474 () Bool)

(declare-fun res!96285 () Bool)

(declare-fun e!132041 () Bool)

(assert (=> b!201474 (=> (not res!96285) (not e!132041))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201474 (= res!96285 (validKeyInArray!0 k!843))))

(declare-fun b!201475 () Bool)

(declare-fun e!132046 () Bool)

(declare-fun tp_is_empty!4903 () Bool)

(assert (=> b!201475 (= e!132046 tp_is_empty!4903)))

(declare-fun res!96283 () Bool)

(assert (=> start!20388 (=> (not res!96283) (not e!132041))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20388 (= res!96283 (validMask!0 mask!1149))))

(assert (=> start!20388 e!132041))

(declare-datatypes ((V!6185 0))(
  ( (V!6186 (val!2496 Int)) )
))
(declare-datatypes ((ValueCell!2108 0))(
  ( (ValueCellFull!2108 (v!4466 V!6185)) (EmptyCell!2108) )
))
(declare-datatypes ((array!9035 0))(
  ( (array!9036 (arr!4268 (Array (_ BitVec 32) ValueCell!2108)) (size!4593 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9035)

(declare-fun e!132043 () Bool)

(declare-fun array_inv!2815 (array!9035) Bool)

(assert (=> start!20388 (and (array_inv!2815 _values!649) e!132043)))

(assert (=> start!20388 true))

(assert (=> start!20388 tp_is_empty!4903))

(declare-datatypes ((array!9037 0))(
  ( (array!9038 (arr!4269 (Array (_ BitVec 32) (_ BitVec 64))) (size!4594 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9037)

(declare-fun array_inv!2816 (array!9037) Bool)

(assert (=> start!20388 (array_inv!2816 _keys!825)))

(assert (=> start!20388 tp!18173))

(declare-fun b!201476 () Bool)

(declare-fun res!96278 () Bool)

(assert (=> b!201476 (=> (not res!96278) (not e!132041))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201476 (= res!96278 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4594 _keys!825))))))

(declare-fun b!201477 () Bool)

(declare-fun res!96282 () Bool)

(assert (=> b!201477 (=> (not res!96282) (not e!132041))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201477 (= res!96282 (and (= (size!4593 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4594 _keys!825) (size!4593 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201478 () Bool)

(declare-fun e!132042 () Bool)

(assert (=> b!201478 (= e!132042 tp_is_empty!4903)))

(declare-fun b!201479 () Bool)

(declare-fun res!96281 () Bool)

(assert (=> b!201479 (=> (not res!96281) (not e!132041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9037 (_ BitVec 32)) Bool)

(assert (=> b!201479 (= res!96281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8423 () Bool)

(declare-fun mapRes!8423 () Bool)

(assert (=> mapIsEmpty!8423 mapRes!8423))

(declare-fun b!201480 () Bool)

(declare-fun e!132045 () Bool)

(declare-fun e!132044 () Bool)

(assert (=> b!201480 (= e!132045 e!132044)))

(declare-fun res!96280 () Bool)

(assert (=> b!201480 (=> res!96280 e!132044)))

(assert (=> b!201480 (= res!96280 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3778 0))(
  ( (tuple2!3779 (_1!1900 (_ BitVec 64)) (_2!1900 V!6185)) )
))
(declare-datatypes ((List!2691 0))(
  ( (Nil!2688) (Cons!2687 (h!3329 tuple2!3778) (t!7622 List!2691)) )
))
(declare-datatypes ((ListLongMap!2691 0))(
  ( (ListLongMap!2692 (toList!1361 List!2691)) )
))
(declare-fun lt!100416 () ListLongMap!2691)

(declare-fun lt!100418 () ListLongMap!2691)

(assert (=> b!201480 (= lt!100416 lt!100418)))

(declare-fun lt!100421 () ListLongMap!2691)

(declare-fun lt!100430 () tuple2!3778)

(declare-fun +!388 (ListLongMap!2691 tuple2!3778) ListLongMap!2691)

(assert (=> b!201480 (= lt!100418 (+!388 lt!100421 lt!100430))))

(declare-fun v!520 () V!6185)

(declare-fun zeroValue!615 () V!6185)

(declare-datatypes ((Unit!6076 0))(
  ( (Unit!6077) )
))
(declare-fun lt!100424 () Unit!6076)

(declare-fun lt!100423 () ListLongMap!2691)

(declare-fun addCommutativeForDiffKeys!109 (ListLongMap!2691 (_ BitVec 64) V!6185 (_ BitVec 64) V!6185) Unit!6076)

(assert (=> b!201480 (= lt!100424 (addCommutativeForDiffKeys!109 lt!100423 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100428 () ListLongMap!2691)

(declare-fun lt!100426 () tuple2!3778)

(assert (=> b!201480 (= lt!100428 (+!388 lt!100416 lt!100426))))

(declare-fun lt!100420 () ListLongMap!2691)

(declare-fun lt!100427 () tuple2!3778)

(assert (=> b!201480 (= lt!100416 (+!388 lt!100420 lt!100427))))

(declare-fun lt!100419 () ListLongMap!2691)

(declare-fun lt!100417 () ListLongMap!2691)

(assert (=> b!201480 (= lt!100419 lt!100417)))

(assert (=> b!201480 (= lt!100417 (+!388 lt!100421 lt!100426))))

(assert (=> b!201480 (= lt!100421 (+!388 lt!100423 lt!100427))))

(declare-fun lt!100425 () ListLongMap!2691)

(assert (=> b!201480 (= lt!100428 (+!388 (+!388 lt!100425 lt!100427) lt!100426))))

(declare-fun minValue!615 () V!6185)

(assert (=> b!201480 (= lt!100426 (tuple2!3779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201480 (= lt!100427 (tuple2!3779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201481 () Bool)

(assert (=> b!201481 (= e!132043 (and e!132042 mapRes!8423))))

(declare-fun condMapEmpty!8423 () Bool)

(declare-fun mapDefault!8423 () ValueCell!2108)

