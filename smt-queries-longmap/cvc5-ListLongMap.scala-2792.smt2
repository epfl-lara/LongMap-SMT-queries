; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40640 () Bool)

(assert start!40640)

(declare-fun b_free!10651 () Bool)

(declare-fun b_next!10651 () Bool)

(assert (=> start!40640 (= b_free!10651 (not b_next!10651))))

(declare-fun tp!37772 () Bool)

(declare-fun b_and!18659 () Bool)

(assert (=> start!40640 (= tp!37772 b_and!18659)))

(declare-fun res!266847 () Bool)

(declare-fun e!263277 () Bool)

(assert (=> start!40640 (=> (not res!266847) (not e!263277))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27785 0))(
  ( (array!27786 (arr!13338 (Array (_ BitVec 32) (_ BitVec 64))) (size!13690 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27785)

(assert (=> start!40640 (= res!266847 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13690 _keys!709))))))

(assert (=> start!40640 e!263277))

(declare-fun tp_is_empty!11989 () Bool)

(assert (=> start!40640 tp_is_empty!11989))

(assert (=> start!40640 tp!37772))

(assert (=> start!40640 true))

(declare-datatypes ((V!17091 0))(
  ( (V!17092 (val!6039 Int)) )
))
(declare-datatypes ((ValueCell!5651 0))(
  ( (ValueCellFull!5651 (v!8294 V!17091)) (EmptyCell!5651) )
))
(declare-datatypes ((array!27787 0))(
  ( (array!27788 (arr!13339 (Array (_ BitVec 32) ValueCell!5651)) (size!13691 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27787)

(declare-fun e!263280 () Bool)

(declare-fun array_inv!9668 (array!27787) Bool)

(assert (=> start!40640 (and (array_inv!9668 _values!549) e!263280)))

(declare-fun array_inv!9669 (array!27785) Bool)

(assert (=> start!40640 (array_inv!9669 _keys!709)))

(declare-fun b!448817 () Bool)

(declare-fun e!263282 () Bool)

(declare-fun mapRes!19617 () Bool)

(assert (=> b!448817 (= e!263280 (and e!263282 mapRes!19617))))

(declare-fun condMapEmpty!19617 () Bool)

(declare-fun mapDefault!19617 () ValueCell!5651)

