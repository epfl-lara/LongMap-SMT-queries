; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37170 () Bool)

(assert start!37170)

(declare-fun b_free!8297 () Bool)

(declare-fun b_next!8297 () Bool)

(assert (=> start!37170 (= b_free!8297 (not b_next!8297))))

(declare-fun tp!29606 () Bool)

(declare-fun b_and!15539 () Bool)

(assert (=> start!37170 (= tp!29606 b_and!15539)))

(declare-fun mapNonEmpty!14982 () Bool)

(declare-fun mapRes!14982 () Bool)

(declare-fun tp!29607 () Bool)

(declare-fun e!228564 () Bool)

(assert (=> mapNonEmpty!14982 (= mapRes!14982 (and tp!29607 e!228564))))

(declare-datatypes ((V!13031 0))(
  ( (V!13032 (val!4517 Int)) )
))
(declare-datatypes ((ValueCell!4129 0))(
  ( (ValueCellFull!4129 (v!6714 V!13031)) (EmptyCell!4129) )
))
(declare-fun mapRest!14982 () (Array (_ BitVec 32) ValueCell!4129))

(declare-datatypes ((array!21827 0))(
  ( (array!21828 (arr!10382 (Array (_ BitVec 32) ValueCell!4129)) (size!10734 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21827)

(declare-fun mapKey!14982 () (_ BitVec 32))

(declare-fun mapValue!14982 () ValueCell!4129)

(assert (=> mapNonEmpty!14982 (= (arr!10382 _values!506) (store mapRest!14982 mapKey!14982 mapValue!14982))))

(declare-fun b!375117 () Bool)

(declare-fun e!228561 () Bool)

(assert (=> b!375117 (= e!228561 true)))

(declare-datatypes ((tuple2!6010 0))(
  ( (tuple2!6011 (_1!3016 (_ BitVec 64)) (_2!3016 V!13031)) )
))
(declare-datatypes ((List!5853 0))(
  ( (Nil!5850) (Cons!5849 (h!6705 tuple2!6010) (t!11003 List!5853)) )
))
(declare-datatypes ((ListLongMap!4923 0))(
  ( (ListLongMap!4924 (toList!2477 List!5853)) )
))
(declare-fun lt!173386 () ListLongMap!4923)

(declare-fun lt!173389 () tuple2!6010)

(declare-fun lt!173380 () ListLongMap!4923)

(declare-fun lt!173385 () tuple2!6010)

(declare-fun +!823 (ListLongMap!4923 tuple2!6010) ListLongMap!4923)

(assert (=> b!375117 (= (+!823 lt!173380 lt!173389) (+!823 lt!173386 lt!173385))))

(declare-fun v!373 () V!13031)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!13031)

(declare-fun lt!173387 () ListLongMap!4923)

(declare-datatypes ((Unit!11552 0))(
  ( (Unit!11553) )
))
(declare-fun lt!173378 () Unit!11552)

(declare-fun addCommutativeForDiffKeys!244 (ListLongMap!4923 (_ BitVec 64) V!13031 (_ BitVec 64) V!13031) Unit!11552)

(assert (=> b!375117 (= lt!173378 (addCommutativeForDiffKeys!244 lt!173387 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375118 () Bool)

(declare-fun e!228562 () Bool)

(declare-fun e!228566 () Bool)

(assert (=> b!375118 (= e!228562 (and e!228566 mapRes!14982))))

(declare-fun condMapEmpty!14982 () Bool)

(declare-fun mapDefault!14982 () ValueCell!4129)

