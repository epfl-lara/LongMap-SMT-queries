; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35516 () Bool)

(assert start!35516)

(declare-fun b!355916 () Bool)

(declare-fun res!197461 () Bool)

(declare-fun e!218066 () Bool)

(assert (=> b!355916 (=> (not res!197461) (not e!218066))))

(declare-datatypes ((array!19515 0))(
  ( (array!19516 (arr!9251 (Array (_ BitVec 32) (_ BitVec 64))) (size!9603 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19515)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19515 (_ BitVec 32)) Bool)

(assert (=> b!355916 (= res!197461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!197459 () Bool)

(assert (=> start!35516 (=> (not res!197459) (not e!218066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35516 (= res!197459 (validMask!0 mask!1842))))

(assert (=> start!35516 e!218066))

(assert (=> start!35516 true))

(declare-datatypes ((V!11603 0))(
  ( (V!11604 (val!4029 Int)) )
))
(declare-datatypes ((ValueCell!3641 0))(
  ( (ValueCellFull!3641 (v!6223 V!11603)) (EmptyCell!3641) )
))
(declare-datatypes ((array!19517 0))(
  ( (array!19518 (arr!9252 (Array (_ BitVec 32) ValueCell!3641)) (size!9604 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19517)

(declare-fun e!218063 () Bool)

(declare-fun array_inv!6800 (array!19517) Bool)

(assert (=> start!35516 (and (array_inv!6800 _values!1208) e!218063)))

(declare-fun array_inv!6801 (array!19515) Bool)

(assert (=> start!35516 (array_inv!6801 _keys!1456)))

(declare-fun b!355917 () Bool)

(declare-fun e!218064 () Bool)

(declare-fun tp_is_empty!7969 () Bool)

(assert (=> b!355917 (= e!218064 tp_is_empty!7969)))

(declare-fun b!355918 () Bool)

(assert (=> b!355918 (= e!218066 false)))

(declare-fun lt!165869 () Bool)

(declare-datatypes ((List!5353 0))(
  ( (Nil!5350) (Cons!5349 (h!6205 (_ BitVec 64)) (t!10503 List!5353)) )
))
(declare-fun arrayNoDuplicates!0 (array!19515 (_ BitVec 32) List!5353) Bool)

(assert (=> b!355918 (= lt!165869 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5350))))

(declare-fun mapIsEmpty!13461 () Bool)

(declare-fun mapRes!13461 () Bool)

(assert (=> mapIsEmpty!13461 mapRes!13461))

(declare-fun b!355919 () Bool)

(declare-fun res!197460 () Bool)

(assert (=> b!355919 (=> (not res!197460) (not e!218066))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355919 (= res!197460 (and (= (size!9604 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9603 _keys!1456) (size!9604 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355920 () Bool)

(assert (=> b!355920 (= e!218063 (and e!218064 mapRes!13461))))

(declare-fun condMapEmpty!13461 () Bool)

(declare-fun mapDefault!13461 () ValueCell!3641)

