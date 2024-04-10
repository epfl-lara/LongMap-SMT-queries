; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39260 () Bool)

(assert start!39260)

(declare-fun b_free!9527 () Bool)

(declare-fun b_next!9527 () Bool)

(assert (=> start!39260 (= b_free!9527 (not b_next!9527))))

(declare-fun tp!34109 () Bool)

(declare-fun b_and!16929 () Bool)

(assert (=> start!39260 (= tp!34109 b_and!16929)))

(declare-fun b!414834 () Bool)

(declare-fun e!247866 () Bool)

(assert (=> b!414834 (= e!247866 true)))

(declare-datatypes ((V!15343 0))(
  ( (V!15344 (val!5384 Int)) )
))
(declare-fun minValue!515 () V!15343)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25215 0))(
  ( (array!25216 (arr!12057 (Array (_ BitVec 32) (_ BitVec 64))) (size!12409 (_ BitVec 32))) )
))
(declare-fun lt!190099 () array!25215)

(declare-fun zeroValue!515 () V!15343)

(declare-datatypes ((ValueCell!4996 0))(
  ( (ValueCellFull!4996 (v!7631 V!15343)) (EmptyCell!4996) )
))
(declare-datatypes ((array!25217 0))(
  ( (array!25218 (arr!12058 (Array (_ BitVec 32) ValueCell!4996)) (size!12410 (_ BitVec 32))) )
))
(declare-fun lt!190103 () array!25217)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7008 0))(
  ( (tuple2!7009 (_1!3515 (_ BitVec 64)) (_2!3515 V!15343)) )
))
(declare-datatypes ((List!7030 0))(
  ( (Nil!7027) (Cons!7026 (h!7882 tuple2!7008) (t!12222 List!7030)) )
))
(declare-datatypes ((ListLongMap!5921 0))(
  ( (ListLongMap!5922 (toList!2976 List!7030)) )
))
(declare-fun lt!190102 () ListLongMap!5921)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1181 (ListLongMap!5921 tuple2!7008) ListLongMap!5921)

(declare-fun getCurrentListMapNoExtraKeys!1182 (array!25215 array!25217 (_ BitVec 32) (_ BitVec 32) V!15343 V!15343 (_ BitVec 32) Int) ListLongMap!5921)

(declare-fun get!5947 (ValueCell!4996 V!15343) V!15343)

(declare-fun dynLambda!658 (Int (_ BitVec 64)) V!15343)

(assert (=> b!414834 (= lt!190102 (+!1181 (getCurrentListMapNoExtraKeys!1182 lt!190099 lt!190103 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7009 (select (arr!12057 lt!190099) from!863) (get!5947 (select (arr!12058 lt!190103) from!863) (dynLambda!658 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun _values!549 () array!25217)

(declare-fun c!55004 () Bool)

(declare-fun _keys!709 () array!25215)

(declare-fun call!28759 () ListLongMap!5921)

(declare-fun bm!28756 () Bool)

(assert (=> bm!28756 (= call!28759 (getCurrentListMapNoExtraKeys!1182 (ite c!55004 _keys!709 lt!190099) (ite c!55004 _values!549 lt!190103) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414835 () Bool)

(declare-fun res!241261 () Bool)

(declare-fun e!247864 () Bool)

(assert (=> b!414835 (=> (not res!241261) (not e!247864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25215 (_ BitVec 32)) Bool)

(assert (=> b!414835 (= res!241261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414836 () Bool)

(declare-fun res!241251 () Bool)

(assert (=> b!414836 (=> (not res!241251) (not e!247864))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414836 (= res!241251 (validKeyInArray!0 k!794))))

(declare-fun b!414837 () Bool)

(declare-fun res!241254 () Bool)

(assert (=> b!414837 (=> (not res!241254) (not e!247864))))

(assert (=> b!414837 (= res!241254 (and (= (size!12410 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12409 _keys!709) (size!12410 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414838 () Bool)

(declare-fun res!241260 () Bool)

(assert (=> b!414838 (=> (not res!241260) (not e!247864))))

(declare-datatypes ((List!7031 0))(
  ( (Nil!7028) (Cons!7027 (h!7883 (_ BitVec 64)) (t!12223 List!7031)) )
))
(declare-fun arrayNoDuplicates!0 (array!25215 (_ BitVec 32) List!7031) Bool)

(assert (=> b!414838 (= res!241260 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7028))))

(declare-fun b!414839 () Bool)

(declare-fun res!241263 () Bool)

(assert (=> b!414839 (=> (not res!241263) (not e!247864))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414839 (= res!241263 (or (= (select (arr!12057 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12057 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!241258 () Bool)

(assert (=> start!39260 (=> (not res!241258) (not e!247864))))

(assert (=> start!39260 (= res!241258 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12409 _keys!709))))))

(assert (=> start!39260 e!247864))

(declare-fun tp_is_empty!10679 () Bool)

(assert (=> start!39260 tp_is_empty!10679))

(assert (=> start!39260 tp!34109))

(assert (=> start!39260 true))

(declare-fun e!247871 () Bool)

(declare-fun array_inv!8794 (array!25217) Bool)

(assert (=> start!39260 (and (array_inv!8794 _values!549) e!247871)))

(declare-fun array_inv!8795 (array!25215) Bool)

(assert (=> start!39260 (array_inv!8795 _keys!709)))

(declare-fun b!414840 () Bool)

(declare-fun e!247872 () Bool)

(declare-fun mapRes!17640 () Bool)

(assert (=> b!414840 (= e!247871 (and e!247872 mapRes!17640))))

(declare-fun condMapEmpty!17640 () Bool)

(declare-fun mapDefault!17640 () ValueCell!4996)

