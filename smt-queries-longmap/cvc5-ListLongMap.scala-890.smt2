; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20436 () Bool)

(assert start!20436)

(declare-fun b_free!5095 () Bool)

(declare-fun b_next!5095 () Bool)

(assert (=> start!20436 (= b_free!5095 (not b_next!5095))))

(declare-fun tp!18317 () Bool)

(declare-fun b_and!11841 () Bool)

(assert (=> start!20436 (= tp!18317 b_and!11841)))

(declare-fun b!202340 () Bool)

(declare-fun res!96934 () Bool)

(declare-fun e!132551 () Bool)

(assert (=> b!202340 (=> (not res!96934) (not e!132551))))

(declare-datatypes ((array!9127 0))(
  ( (array!9128 (arr!4314 (Array (_ BitVec 32) (_ BitVec 64))) (size!4639 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9127)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9127 (_ BitVec 32)) Bool)

(assert (=> b!202340 (= res!96934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!96935 () Bool)

(assert (=> start!20436 (=> (not res!96935) (not e!132551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20436 (= res!96935 (validMask!0 mask!1149))))

(assert (=> start!20436 e!132551))

(declare-datatypes ((V!6249 0))(
  ( (V!6250 (val!2520 Int)) )
))
(declare-datatypes ((ValueCell!2132 0))(
  ( (ValueCellFull!2132 (v!4490 V!6249)) (EmptyCell!2132) )
))
(declare-datatypes ((array!9129 0))(
  ( (array!9130 (arr!4315 (Array (_ BitVec 32) ValueCell!2132)) (size!4640 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9129)

(declare-fun e!132549 () Bool)

(declare-fun array_inv!2849 (array!9129) Bool)

(assert (=> start!20436 (and (array_inv!2849 _values!649) e!132549)))

(assert (=> start!20436 true))

(declare-fun tp_is_empty!4951 () Bool)

(assert (=> start!20436 tp_is_empty!4951))

(declare-fun array_inv!2850 (array!9127) Bool)

(assert (=> start!20436 (array_inv!2850 _keys!825)))

(assert (=> start!20436 tp!18317))

(declare-fun b!202341 () Bool)

(declare-fun res!96933 () Bool)

(declare-fun e!132545 () Bool)

(assert (=> b!202341 (=> (not res!96933) (not e!132545))))

(declare-datatypes ((tuple2!3820 0))(
  ( (tuple2!3821 (_1!1921 (_ BitVec 64)) (_2!1921 V!6249)) )
))
(declare-datatypes ((List!2727 0))(
  ( (Nil!2724) (Cons!2723 (h!3365 tuple2!3820) (t!7658 List!2727)) )
))
(declare-datatypes ((ListLongMap!2733 0))(
  ( (ListLongMap!2734 (toList!1382 List!2727)) )
))
(declare-fun lt!101557 () ListLongMap!2733)

(declare-fun lt!101554 () tuple2!3820)

(declare-fun lt!101556 () ListLongMap!2733)

(declare-fun +!409 (ListLongMap!2733 tuple2!3820) ListLongMap!2733)

(assert (=> b!202341 (= res!96933 (= lt!101556 (+!409 lt!101557 lt!101554)))))

(declare-fun b!202342 () Bool)

(declare-fun e!132547 () Bool)

(assert (=> b!202342 (= e!132547 tp_is_empty!4951)))

(declare-fun lt!101558 () ListLongMap!2733)

(declare-fun b!202343 () Bool)

(declare-fun lt!101559 () ListLongMap!2733)

(assert (=> b!202343 (= e!132545 (= lt!101558 (+!409 lt!101559 lt!101554)))))

(declare-fun mapNonEmpty!8495 () Bool)

(declare-fun mapRes!8495 () Bool)

(declare-fun tp!18316 () Bool)

(assert (=> mapNonEmpty!8495 (= mapRes!8495 (and tp!18316 e!132547))))

(declare-fun mapRest!8495 () (Array (_ BitVec 32) ValueCell!2132))

(declare-fun mapKey!8495 () (_ BitVec 32))

(declare-fun mapValue!8495 () ValueCell!2132)

(assert (=> mapNonEmpty!8495 (= (arr!4315 _values!649) (store mapRest!8495 mapKey!8495 mapValue!8495))))

(declare-fun b!202344 () Bool)

(declare-fun res!96937 () Bool)

(assert (=> b!202344 (=> (not res!96937) (not e!132551))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!202344 (= res!96937 (= (select (arr!4314 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!8495 () Bool)

(assert (=> mapIsEmpty!8495 mapRes!8495))

(declare-fun b!202345 () Bool)

(declare-fun e!132550 () Bool)

(assert (=> b!202345 (= e!132549 (and e!132550 mapRes!8495))))

(declare-fun condMapEmpty!8495 () Bool)

(declare-fun mapDefault!8495 () ValueCell!2132)

