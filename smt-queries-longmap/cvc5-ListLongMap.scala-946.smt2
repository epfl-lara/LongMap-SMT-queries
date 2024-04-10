; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20772 () Bool)

(assert start!20772)

(declare-fun b!208068 () Bool)

(declare-fun res!101145 () Bool)

(declare-fun e!135748 () Bool)

(assert (=> b!208068 (=> (not res!101145) (not e!135748))))

(declare-datatypes ((array!9779 0))(
  ( (array!9780 (arr!4640 (Array (_ BitVec 32) (_ BitVec 64))) (size!4965 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9779)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6697 0))(
  ( (V!6698 (val!2688 Int)) )
))
(declare-datatypes ((ValueCell!2300 0))(
  ( (ValueCellFull!2300 (v!4658 V!6697)) (EmptyCell!2300) )
))
(declare-datatypes ((array!9781 0))(
  ( (array!9782 (arr!4641 (Array (_ BitVec 32) ValueCell!2300)) (size!4966 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9781)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208068 (= res!101145 (and (= (size!4966 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4965 _keys!825) (size!4966 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208069 () Bool)

(declare-fun e!135745 () Bool)

(declare-fun e!135747 () Bool)

(declare-fun mapRes!8999 () Bool)

(assert (=> b!208069 (= e!135745 (and e!135747 mapRes!8999))))

(declare-fun condMapEmpty!8999 () Bool)

(declare-fun mapDefault!8999 () ValueCell!2300)

