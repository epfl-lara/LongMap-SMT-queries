; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38474 () Bool)

(assert start!38474)

(declare-fun b!397139 () Bool)

(declare-fun res!227979 () Bool)

(declare-fun e!240217 () Bool)

(assert (=> b!397139 (=> (not res!227979) (not e!240217))))

(declare-datatypes ((array!23699 0))(
  ( (array!23700 (arr!11299 (Array (_ BitVec 32) (_ BitVec 64))) (size!11651 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23699)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397139 (= res!227979 (or (= (select (arr!11299 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11299 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397140 () Bool)

(declare-fun e!240219 () Bool)

(assert (=> b!397140 (= e!240219 false)))

(declare-fun lt!187258 () Bool)

(declare-fun lt!187259 () array!23699)

(declare-datatypes ((List!6542 0))(
  ( (Nil!6539) (Cons!6538 (h!7394 (_ BitVec 64)) (t!11716 List!6542)) )
))
(declare-fun arrayNoDuplicates!0 (array!23699 (_ BitVec 32) List!6542) Bool)

(assert (=> b!397140 (= lt!187258 (arrayNoDuplicates!0 lt!187259 #b00000000000000000000000000000000 Nil!6539))))

(declare-fun b!397141 () Bool)

(declare-fun e!240221 () Bool)

(declare-fun e!240220 () Bool)

(declare-fun mapRes!16461 () Bool)

(assert (=> b!397141 (= e!240221 (and e!240220 mapRes!16461))))

(declare-fun condMapEmpty!16461 () Bool)

(declare-datatypes ((V!14295 0))(
  ( (V!14296 (val!4991 Int)) )
))
(declare-datatypes ((ValueCell!4603 0))(
  ( (ValueCellFull!4603 (v!7238 V!14295)) (EmptyCell!4603) )
))
(declare-datatypes ((array!23701 0))(
  ( (array!23702 (arr!11300 (Array (_ BitVec 32) ValueCell!4603)) (size!11652 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23701)

(declare-fun mapDefault!16461 () ValueCell!4603)

