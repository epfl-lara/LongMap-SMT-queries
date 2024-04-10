; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100130 () Bool)

(assert start!100130)

(declare-fun b!1194094 () Bool)

(declare-fun res!794465 () Bool)

(declare-fun e!678634 () Bool)

(assert (=> b!1194094 (=> (not res!794465) (not e!678634))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77257 0))(
  ( (array!77258 (arr!37278 (Array (_ BitVec 32) (_ BitVec 64))) (size!37814 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77257)

(assert (=> b!1194094 (= res!794465 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37814 _keys!1208))))))

(declare-fun b!1194095 () Bool)

(declare-fun e!678637 () Bool)

(declare-fun e!678632 () Bool)

(declare-fun mapRes!47186 () Bool)

(assert (=> b!1194095 (= e!678637 (and e!678632 mapRes!47186))))

(declare-fun condMapEmpty!47186 () Bool)

(declare-datatypes ((V!45445 0))(
  ( (V!45446 (val!15176 Int)) )
))
(declare-datatypes ((ValueCell!14410 0))(
  ( (ValueCellFull!14410 (v!17814 V!45445)) (EmptyCell!14410) )
))
(declare-datatypes ((array!77259 0))(
  ( (array!77260 (arr!37279 (Array (_ BitVec 32) ValueCell!14410)) (size!37815 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77259)

(declare-fun mapDefault!47186 () ValueCell!14410)

