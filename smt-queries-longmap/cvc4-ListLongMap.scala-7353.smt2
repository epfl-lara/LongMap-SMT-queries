; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93826 () Bool)

(assert start!93826)

(declare-fun b_free!21299 () Bool)

(declare-fun b_next!21299 () Bool)

(assert (=> start!93826 (= b_free!21299 (not b_next!21299))))

(declare-fun tp!75320 () Bool)

(declare-fun b_and!34013 () Bool)

(assert (=> start!93826 (= tp!75320 b_and!34013)))

(declare-fun mapIsEmpty!39334 () Bool)

(declare-fun mapRes!39334 () Bool)

(assert (=> mapIsEmpty!39334 mapRes!39334))

(declare-fun b!1061201 () Bool)

(declare-fun res!708686 () Bool)

(declare-fun e!604274 () Bool)

(assert (=> b!1061201 (=> (not res!708686) (not e!604274))))

(declare-datatypes ((array!67221 0))(
  ( (array!67222 (arr!32318 (Array (_ BitVec 32) (_ BitVec 64))) (size!32854 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67221)

(declare-datatypes ((List!22514 0))(
  ( (Nil!22511) (Cons!22510 (h!23719 (_ BitVec 64)) (t!31823 List!22514)) )
))
(declare-fun arrayNoDuplicates!0 (array!67221 (_ BitVec 32) List!22514) Bool)

(assert (=> b!1061201 (= res!708686 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22511))))

(declare-fun b!1061202 () Bool)

(declare-fun e!604277 () Bool)

(declare-fun e!604276 () Bool)

(assert (=> b!1061202 (= e!604277 (and e!604276 mapRes!39334))))

(declare-fun condMapEmpty!39334 () Bool)

(declare-datatypes ((V!38613 0))(
  ( (V!38614 (val!12605 Int)) )
))
(declare-datatypes ((ValueCell!11851 0))(
  ( (ValueCellFull!11851 (v!15215 V!38613)) (EmptyCell!11851) )
))
(declare-datatypes ((array!67223 0))(
  ( (array!67224 (arr!32319 (Array (_ BitVec 32) ValueCell!11851)) (size!32855 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67223)

(declare-fun mapDefault!39334 () ValueCell!11851)

