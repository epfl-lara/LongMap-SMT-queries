; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84128 () Bool)

(assert start!84128)

(declare-fun mapIsEmpty!36425 () Bool)

(declare-fun mapRes!36425 () Bool)

(assert (=> mapIsEmpty!36425 mapRes!36425))

(declare-fun b!983645 () Bool)

(declare-fun e!554532 () Bool)

(assert (=> b!983645 (= e!554532 false)))

(declare-fun lt!436553 () Bool)

(declare-datatypes ((array!61847 0))(
  ( (array!61848 (arr!29781 (Array (_ BitVec 32) (_ BitVec 64))) (size!30260 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61847)

(declare-datatypes ((List!20620 0))(
  ( (Nil!20617) (Cons!20616 (h!21778 (_ BitVec 64)) (t!29411 List!20620)) )
))
(declare-fun arrayNoDuplicates!0 (array!61847 (_ BitVec 32) List!20620) Bool)

(assert (=> b!983645 (= lt!436553 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20617))))

(declare-fun b!983646 () Bool)

(declare-fun e!554535 () Bool)

(declare-fun e!554531 () Bool)

(assert (=> b!983646 (= e!554535 (and e!554531 mapRes!36425))))

(declare-fun condMapEmpty!36425 () Bool)

(declare-datatypes ((V!35557 0))(
  ( (V!35558 (val!11516 Int)) )
))
(declare-datatypes ((ValueCell!10984 0))(
  ( (ValueCellFull!10984 (v!14078 V!35557)) (EmptyCell!10984) )
))
(declare-datatypes ((array!61849 0))(
  ( (array!61850 (arr!29782 (Array (_ BitVec 32) ValueCell!10984)) (size!30261 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61849)

(declare-fun mapDefault!36425 () ValueCell!10984)

