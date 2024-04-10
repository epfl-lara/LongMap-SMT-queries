; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38720 () Bool)

(assert start!38720)

(declare-fun b_free!9257 () Bool)

(declare-fun b_next!9257 () Bool)

(assert (=> start!38720 (= b_free!9257 (not b_next!9257))))

(declare-fun tp!32894 () Bool)

(declare-fun b_and!16643 () Bool)

(assert (=> start!38720 (= tp!32894 b_and!16643)))

(declare-fun res!232209 () Bool)

(declare-fun e!242704 () Bool)

(assert (=> start!38720 (=> (not res!232209) (not e!242704))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24183 0))(
  ( (array!24184 (arr!11541 (Array (_ BitVec 32) (_ BitVec 64))) (size!11893 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24183)

(assert (=> start!38720 (= res!232209 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11893 _keys!709))))))

(assert (=> start!38720 e!242704))

(declare-fun tp_is_empty!10139 () Bool)

(assert (=> start!38720 tp_is_empty!10139))

(assert (=> start!38720 tp!32894))

(assert (=> start!38720 true))

(declare-datatypes ((V!14623 0))(
  ( (V!14624 (val!5114 Int)) )
))
(declare-datatypes ((ValueCell!4726 0))(
  ( (ValueCellFull!4726 (v!7361 V!14623)) (EmptyCell!4726) )
))
(declare-datatypes ((array!24185 0))(
  ( (array!24186 (arr!11542 (Array (_ BitVec 32) ValueCell!4726)) (size!11894 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24185)

(declare-fun e!242706 () Bool)

(declare-fun array_inv!8444 (array!24185) Bool)

(assert (=> start!38720 (and (array_inv!8444 _values!549) e!242706)))

(declare-fun array_inv!8445 (array!24183) Bool)

(assert (=> start!38720 (array_inv!8445 _keys!709)))

(declare-fun b!403012 () Bool)

(declare-fun res!232199 () Bool)

(assert (=> b!403012 (=> (not res!232199) (not e!242704))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24183 (_ BitVec 32)) Bool)

(assert (=> b!403012 (= res!232199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403013 () Bool)

(declare-fun res!232200 () Bool)

(assert (=> b!403013 (=> (not res!232200) (not e!242704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403013 (= res!232200 (validMask!0 mask!1025))))

(declare-fun b!403014 () Bool)

(declare-fun e!242703 () Bool)

(declare-fun mapRes!16830 () Bool)

(assert (=> b!403014 (= e!242706 (and e!242703 mapRes!16830))))

(declare-fun condMapEmpty!16830 () Bool)

(declare-fun mapDefault!16830 () ValueCell!4726)

