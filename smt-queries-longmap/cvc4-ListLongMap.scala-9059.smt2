; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109142 () Bool)

(assert start!109142)

(declare-fun b_free!28631 () Bool)

(declare-fun b_next!28631 () Bool)

(assert (=> start!109142 (= b_free!28631 (not b_next!28631))))

(declare-fun tp!101012 () Bool)

(declare-fun b_and!46721 () Bool)

(assert (=> start!109142 (= tp!101012 b_and!46721)))

(declare-fun b!1290641 () Bool)

(declare-fun e!736818 () Bool)

(declare-fun e!736815 () Bool)

(assert (=> b!1290641 (= e!736818 (not e!736815))))

(declare-fun res!857421 () Bool)

(assert (=> b!1290641 (=> res!857421 e!736815)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290641 (= res!857421 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50797 0))(
  ( (V!50798 (val!17210 Int)) )
))
(declare-datatypes ((tuple2!22116 0))(
  ( (tuple2!22117 (_1!11069 (_ BitVec 64)) (_2!11069 V!50797)) )
))
(declare-datatypes ((List!29282 0))(
  ( (Nil!29279) (Cons!29278 (h!30487 tuple2!22116) (t!42846 List!29282)) )
))
(declare-datatypes ((ListLongMap!19773 0))(
  ( (ListLongMap!19774 (toList!9902 List!29282)) )
))
(declare-fun contains!8020 (ListLongMap!19773 (_ BitVec 64)) Bool)

(assert (=> b!1290641 (not (contains!8020 (ListLongMap!19774 Nil!29279) k!1205))))

(declare-datatypes ((Unit!42718 0))(
  ( (Unit!42719) )
))
(declare-fun lt!578732 () Unit!42718)

(declare-fun emptyContainsNothing!85 ((_ BitVec 64)) Unit!42718)

(assert (=> b!1290641 (= lt!578732 (emptyContainsNothing!85 k!1205))))

(declare-fun b!1290642 () Bool)

(declare-fun e!736816 () Bool)

(declare-fun e!736819 () Bool)

(declare-fun mapRes!52967 () Bool)

(assert (=> b!1290642 (= e!736816 (and e!736819 mapRes!52967))))

(declare-fun condMapEmpty!52967 () Bool)

(declare-datatypes ((ValueCell!16237 0))(
  ( (ValueCellFull!16237 (v!19813 V!50797)) (EmptyCell!16237) )
))
(declare-datatypes ((array!85582 0))(
  ( (array!85583 (arr!41292 (Array (_ BitVec 32) ValueCell!16237)) (size!41842 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85582)

(declare-fun mapDefault!52967 () ValueCell!16237)

