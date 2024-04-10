; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83034 () Bool)

(assert start!83034)

(declare-fun b!968803 () Bool)

(declare-fun res!648513 () Bool)

(declare-fun e!546059 () Bool)

(assert (=> b!968803 (=> (not res!648513) (not e!546059))))

(declare-datatypes ((List!20004 0))(
  ( (Nil!20001) (Cons!20000 (h!21162 (_ BitVec 64)) (t!28367 List!20004)) )
))
(declare-fun noDuplicate!1371 (List!20004) Bool)

(assert (=> b!968803 (= res!648513 (noDuplicate!1371 Nil!20001))))

(declare-fun b!968804 () Bool)

(declare-fun e!546057 () Bool)

(declare-fun e!546058 () Bool)

(declare-fun mapRes!34912 () Bool)

(assert (=> b!968804 (= e!546057 (and e!546058 mapRes!34912))))

(declare-fun condMapEmpty!34912 () Bool)

(declare-datatypes ((V!34233 0))(
  ( (V!34234 (val!11019 Int)) )
))
(declare-datatypes ((ValueCell!10487 0))(
  ( (ValueCellFull!10487 (v!13577 V!34233)) (EmptyCell!10487) )
))
(declare-datatypes ((array!59949 0))(
  ( (array!59950 (arr!28839 (Array (_ BitVec 32) ValueCell!10487)) (size!29318 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59949)

(declare-fun mapDefault!34912 () ValueCell!10487)

