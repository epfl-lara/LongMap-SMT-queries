; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4020 () Bool)

(assert start!4020)

(declare-fun b_free!925 () Bool)

(declare-fun b_next!925 () Bool)

(assert (=> start!4020 (= b_free!925 (not b_next!925))))

(declare-fun tp!4195 () Bool)

(declare-fun b_and!1735 () Bool)

(assert (=> start!4020 (= tp!4195 b_and!1735)))

(declare-fun b!29301 () Bool)

(declare-fun res!17560 () Bool)

(declare-fun e!18925 () Bool)

(assert (=> b!29301 (=> (not res!17560) (not e!18925))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29301 (= res!17560 (validKeyInArray!0 k!1304))))

(declare-fun b!29302 () Bool)

(declare-fun e!18922 () Bool)

(declare-fun tp_is_empty!1279 () Bool)

(assert (=> b!29302 (= e!18922 tp_is_empty!1279)))

(declare-fun b!29303 () Bool)

(declare-fun res!17556 () Bool)

(assert (=> b!29303 (=> (not res!17556) (not e!18925))))

(declare-datatypes ((array!1789 0))(
  ( (array!1790 (arr!848 (Array (_ BitVec 32) (_ BitVec 64))) (size!949 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1789)

(declare-datatypes ((List!703 0))(
  ( (Nil!700) (Cons!699 (h!1266 (_ BitVec 64)) (t!3396 List!703)) )
))
(declare-fun arrayNoDuplicates!0 (array!1789 (_ BitVec 32) List!703) Bool)

(assert (=> b!29303 (= res!17556 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!700))))

(declare-fun mapIsEmpty!1447 () Bool)

(declare-fun mapRes!1447 () Bool)

(assert (=> mapIsEmpty!1447 mapRes!1447))

(declare-fun b!29304 () Bool)

(declare-fun e!18921 () Bool)

(declare-fun e!18926 () Bool)

(assert (=> b!29304 (= e!18921 (and e!18926 mapRes!1447))))

(declare-fun condMapEmpty!1447 () Bool)

(declare-datatypes ((V!1531 0))(
  ( (V!1532 (val!666 Int)) )
))
(declare-datatypes ((ValueCell!440 0))(
  ( (ValueCellFull!440 (v!1755 V!1531)) (EmptyCell!440) )
))
(declare-datatypes ((array!1791 0))(
  ( (array!1792 (arr!849 (Array (_ BitVec 32) ValueCell!440)) (size!950 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1791)

(declare-fun mapDefault!1447 () ValueCell!440)

