; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71084 () Bool)

(assert start!71084)

(declare-fun b_free!13271 () Bool)

(declare-fun b_next!13271 () Bool)

(assert (=> start!71084 (= b_free!13271 (not b_next!13271))))

(declare-fun tp!46569 () Bool)

(declare-fun b_and!22185 () Bool)

(assert (=> start!71084 (= tp!46569 b_and!22185)))

(declare-fun res!562761 () Bool)

(declare-fun e!459506 () Bool)

(assert (=> start!71084 (=> (not res!562761) (not e!459506))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71084 (= res!562761 (validMask!0 mask!1312))))

(assert (=> start!71084 e!459506))

(declare-fun tp_is_empty!14981 () Bool)

(assert (=> start!71084 tp_is_empty!14981))

(declare-datatypes ((array!46146 0))(
  ( (array!46147 (arr!22119 (Array (_ BitVec 32) (_ BitVec 64))) (size!22540 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46146)

(declare-fun array_inv!17633 (array!46146) Bool)

(assert (=> start!71084 (array_inv!17633 _keys!976)))

(assert (=> start!71084 true))

(declare-datatypes ((V!24975 0))(
  ( (V!24976 (val!7538 Int)) )
))
(declare-datatypes ((ValueCell!7075 0))(
  ( (ValueCellFull!7075 (v!9971 V!24975)) (EmptyCell!7075) )
))
(declare-datatypes ((array!46148 0))(
  ( (array!46149 (arr!22120 (Array (_ BitVec 32) ValueCell!7075)) (size!22541 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46148)

(declare-fun e!459509 () Bool)

(declare-fun array_inv!17634 (array!46148) Bool)

(assert (=> start!71084 (and (array_inv!17634 _values!788) e!459509)))

(assert (=> start!71084 tp!46569))

(declare-fun e!459512 () Bool)

(declare-datatypes ((tuple2!9980 0))(
  ( (tuple2!9981 (_1!5001 (_ BitVec 64)) (_2!5001 V!24975)) )
))
(declare-fun lt!372809 () tuple2!9980)

(declare-datatypes ((List!15785 0))(
  ( (Nil!15782) (Cons!15781 (h!16910 tuple2!9980) (t!22130 List!15785)) )
))
(declare-datatypes ((ListLongMap!8803 0))(
  ( (ListLongMap!8804 (toList!4417 List!15785)) )
))
(declare-fun lt!372808 () ListLongMap!8803)

(declare-fun b!825528 () Bool)

(declare-fun zeroValueAfter!34 () V!24975)

(declare-fun lt!372799 () ListLongMap!8803)

(declare-fun +!1924 (ListLongMap!8803 tuple2!9980) ListLongMap!8803)

(assert (=> b!825528 (= e!459512 (= lt!372808 (+!1924 (+!1924 lt!372799 (tuple2!9981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372809)))))

(declare-fun e!459508 () Bool)

(declare-fun b!825529 () Bool)

(declare-fun lt!372801 () tuple2!9980)

(assert (=> b!825529 (= e!459508 (= lt!372808 (+!1924 (+!1924 lt!372799 lt!372809) lt!372801)))))

(declare-fun b!825530 () Bool)

(declare-fun e!459513 () Bool)

(declare-fun mapRes!24094 () Bool)

(assert (=> b!825530 (= e!459509 (and e!459513 mapRes!24094))))

(declare-fun condMapEmpty!24094 () Bool)

(declare-fun mapDefault!24094 () ValueCell!7075)

