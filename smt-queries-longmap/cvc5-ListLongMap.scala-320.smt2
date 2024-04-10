; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5902 () Bool)

(assert start!5902)

(declare-fun b_free!1381 () Bool)

(declare-fun b_next!1381 () Bool)

(assert (=> start!5902 (= b_free!1381 (not b_next!1381))))

(declare-fun tp!5759 () Bool)

(declare-fun b_and!2411 () Bool)

(assert (=> start!5902 (= tp!5759 b_and!2411)))

(declare-fun res!24595 () Bool)

(declare-fun e!26235 () Bool)

(assert (=> start!5902 (=> (not res!24595) (not e!26235))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5902 (= res!24595 (validMask!0 mask!853))))

(assert (=> start!5902 e!26235))

(assert (=> start!5902 true))

(assert (=> start!5902 tp!5759))

(declare-fun b!41416 () Bool)

(declare-fun e!26236 () Bool)

(assert (=> b!41416 (= e!26235 (not e!26236))))

(declare-fun res!24596 () Bool)

(assert (=> b!41416 (=> res!24596 e!26236)))

(declare-datatypes ((V!2121 0))(
  ( (V!2122 (val!924 Int)) )
))
(declare-datatypes ((tuple2!1502 0))(
  ( (tuple2!1503 (_1!762 (_ BitVec 64)) (_2!762 V!2121)) )
))
(declare-datatypes ((List!1070 0))(
  ( (Nil!1067) (Cons!1066 (h!1643 tuple2!1502) (t!3947 List!1070)) )
))
(declare-datatypes ((ListLongMap!1079 0))(
  ( (ListLongMap!1080 (toList!555 List!1070)) )
))
(declare-fun lt!16328 () ListLongMap!1079)

(assert (=> b!41416 (= res!24596 (= lt!16328 (ListLongMap!1080 Nil!1067)))))

(declare-datatypes ((ValueCell!638 0))(
  ( (ValueCellFull!638 (v!2008 V!2121)) (EmptyCell!638) )
))
(declare-datatypes ((array!2627 0))(
  ( (array!2628 (arr!1257 (Array (_ BitVec 32) ValueCell!638)) (size!1409 (_ BitVec 32))) )
))
(declare-fun lt!16330 () array!2627)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16324 () V!2121)

(declare-datatypes ((array!2629 0))(
  ( (array!2630 (arr!1258 (Array (_ BitVec 32) (_ BitVec 64))) (size!1410 (_ BitVec 32))) )
))
(declare-fun lt!16329 () array!2629)

(declare-datatypes ((LongMapFixedSize!256 0))(
  ( (LongMapFixedSize!257 (defaultEntry!1818 Int) (mask!5221 (_ BitVec 32)) (extraKeys!1709 (_ BitVec 32)) (zeroValue!1736 V!2121) (minValue!1736 V!2121) (_size!177 (_ BitVec 32)) (_keys!3325 array!2629) (_values!1801 array!2627) (_vacant!177 (_ BitVec 32))) )
))
(declare-fun map!704 (LongMapFixedSize!256) ListLongMap!1079)

(assert (=> b!41416 (= lt!16328 (map!704 (LongMapFixedSize!257 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16324 lt!16324 #b00000000000000000000000000000000 lt!16329 lt!16330 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1071 0))(
  ( (Nil!1068) (Cons!1067 (h!1644 (_ BitVec 64)) (t!3948 List!1071)) )
))
(declare-fun arrayNoDuplicates!0 (array!2629 (_ BitVec 32) List!1071) Bool)

(assert (=> b!41416 (arrayNoDuplicates!0 lt!16329 #b00000000000000000000000000000000 Nil!1068)))

(declare-datatypes ((Unit!1011 0))(
  ( (Unit!1012) )
))
(declare-fun lt!16327 () Unit!1011)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2629 (_ BitVec 32) (_ BitVec 32) List!1071) Unit!1011)

(assert (=> b!41416 (= lt!16327 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16329 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2629 (_ BitVec 32)) Bool)

(assert (=> b!41416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16329 mask!853)))

(declare-fun lt!16325 () Unit!1011)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2629 (_ BitVec 32) (_ BitVec 32)) Unit!1011)

(assert (=> b!41416 (= lt!16325 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16329 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2629 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41416 (= (arrayCountValidKeys!0 lt!16329 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16331 () Unit!1011)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2629 (_ BitVec 32) (_ BitVec 32)) Unit!1011)

(assert (=> b!41416 (= lt!16331 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16329 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41416 (= lt!16330 (array!2628 ((as const (Array (_ BitVec 32) ValueCell!638)) EmptyCell!638) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41416 (= lt!16329 (array!2630 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!199 (Int (_ BitVec 64)) V!2121)

(assert (=> b!41416 (= lt!16324 (dynLambda!199 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41417 () Bool)

(declare-fun res!24594 () Bool)

(assert (=> b!41417 (=> res!24594 e!26236)))

(declare-fun isEmpty!241 (List!1070) Bool)

(assert (=> b!41417 (= res!24594 (isEmpty!241 (toList!555 lt!16328)))))

(declare-fun b!41419 () Bool)

(assert (=> b!41419 (= e!26236 true)))

(declare-fun lt!16326 () Bool)

(declare-fun contains!523 (ListLongMap!1079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!316 (array!2629 array!2627 (_ BitVec 32) (_ BitVec 32) V!2121 V!2121 (_ BitVec 32) Int) ListLongMap!1079)

(declare-fun head!854 (List!1070) tuple2!1502)

(assert (=> b!41419 (= lt!16326 (contains!523 (getCurrentListMap!316 lt!16329 lt!16330 mask!853 #b00000000000000000000000000000000 lt!16324 lt!16324 #b00000000000000000000000000000000 defaultEntry!470) (_1!762 (head!854 (toList!555 lt!16328)))))))

(declare-fun b!41418 () Bool)

(declare-fun res!24597 () Bool)

(assert (=> b!41418 (=> res!24597 e!26236)))

(assert (=> b!41418 (= res!24597 (bvslt mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!5902 res!24595) b!41416))

(assert (= (and b!41416 (not res!24596)) b!41417))

(assert (= (and b!41417 (not res!24594)) b!41418))

(assert (= (and b!41418 (not res!24597)) b!41419))

(declare-fun b_lambda!2105 () Bool)

(assert (=> (not b_lambda!2105) (not b!41416)))

(declare-fun t!3946 () Bool)

(declare-fun tb!863 () Bool)

(assert (=> (and start!5902 (= defaultEntry!470 defaultEntry!470) t!3946) tb!863))

(declare-fun result!1477 () Bool)

(declare-fun tp_is_empty!1771 () Bool)

(assert (=> tb!863 (= result!1477 tp_is_empty!1771)))

(assert (=> b!41416 t!3946))

(declare-fun b_and!2413 () Bool)

(assert (= b_and!2411 (and (=> t!3946 result!1477) b_and!2413)))

(declare-fun m!34663 () Bool)

(assert (=> start!5902 m!34663))

(declare-fun m!34665 () Bool)

(assert (=> b!41416 m!34665))

(declare-fun m!34667 () Bool)

(assert (=> b!41416 m!34667))

(declare-fun m!34669 () Bool)

(assert (=> b!41416 m!34669))

(declare-fun m!34671 () Bool)

(assert (=> b!41416 m!34671))

(declare-fun m!34673 () Bool)

(assert (=> b!41416 m!34673))

(declare-fun m!34675 () Bool)

(assert (=> b!41416 m!34675))

(declare-fun m!34677 () Bool)

(assert (=> b!41416 m!34677))

(declare-fun m!34679 () Bool)

(assert (=> b!41416 m!34679))

(declare-fun m!34681 () Bool)

(assert (=> b!41417 m!34681))

(declare-fun m!34683 () Bool)

(assert (=> b!41419 m!34683))

(declare-fun m!34685 () Bool)

(assert (=> b!41419 m!34685))

(assert (=> b!41419 m!34683))

(declare-fun m!34687 () Bool)

(assert (=> b!41419 m!34687))

(push 1)

(assert (not start!5902))

(assert (not b!41419))

(assert tp_is_empty!1771)

(assert (not b_lambda!2105))

(assert (not b!41417))

(assert (not b!41416))

(assert b_and!2413)

(assert (not b_next!1381))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2413)

(assert (not b_next!1381))

(check-sat)

(pop 1)

