; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20986 () Bool)

(assert start!20986)

(declare-fun b_free!5557 () Bool)

(declare-fun b_next!5557 () Bool)

(assert (=> start!20986 (= b_free!5557 (not b_next!5557))))

(declare-fun tp!19724 () Bool)

(declare-fun b_and!12351 () Bool)

(assert (=> start!20986 (= tp!19724 b_and!12351)))

(declare-fun b!210888 () Bool)

(declare-fun e!137308 () Bool)

(declare-fun tp_is_empty!5419 () Bool)

(assert (=> b!210888 (= e!137308 tp_is_empty!5419)))

(declare-fun b!210889 () Bool)

(declare-fun res!102939 () Bool)

(declare-fun e!137306 () Bool)

(assert (=> b!210889 (=> (not res!102939) (not e!137306))))

(declare-datatypes ((array!10039 0))(
  ( (array!10040 (arr!4766 (Array (_ BitVec 32) (_ BitVec 64))) (size!5091 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10039)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6873 0))(
  ( (V!6874 (val!2754 Int)) )
))
(declare-datatypes ((ValueCell!2366 0))(
  ( (ValueCellFull!2366 (v!4740 V!6873)) (EmptyCell!2366) )
))
(declare-datatypes ((array!10041 0))(
  ( (array!10042 (arr!4767 (Array (_ BitVec 32) ValueCell!2366)) (size!5092 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10041)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210889 (= res!102939 (and (= (size!5092 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5091 _keys!825) (size!5092 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210890 () Bool)

(declare-fun e!137309 () Bool)

(declare-fun e!137307 () Bool)

(declare-fun mapRes!9209 () Bool)

(assert (=> b!210890 (= e!137309 (and e!137307 mapRes!9209))))

(declare-fun condMapEmpty!9209 () Bool)

(declare-fun mapDefault!9209 () ValueCell!2366)

