; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20316 () Bool)

(assert start!20316)

(declare-fun b_free!4975 () Bool)

(declare-fun b_next!4975 () Bool)

(assert (=> start!20316 (= b_free!4975 (not b_next!4975))))

(declare-fun tp!17957 () Bool)

(declare-fun b_and!11721 () Bool)

(assert (=> start!20316 (= tp!17957 b_and!11721)))

(declare-fun b!200180 () Bool)

(declare-fun e!131297 () Bool)

(declare-fun tp_is_empty!4831 () Bool)

(assert (=> b!200180 (= e!131297 tp_is_empty!4831)))

(declare-fun b!200181 () Bool)

(declare-fun res!95311 () Bool)

(declare-fun e!131296 () Bool)

(assert (=> b!200181 (=> (not res!95311) (not e!131296))))

(declare-datatypes ((array!8897 0))(
  ( (array!8898 (arr!4199 (Array (_ BitVec 32) (_ BitVec 64))) (size!4524 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8897)

(declare-datatypes ((List!2634 0))(
  ( (Nil!2631) (Cons!2630 (h!3272 (_ BitVec 64)) (t!7565 List!2634)) )
))
(declare-fun arrayNoDuplicates!0 (array!8897 (_ BitVec 32) List!2634) Bool)

(assert (=> b!200181 (= res!95311 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2631))))

(declare-fun b!200182 () Bool)

(declare-fun res!95317 () Bool)

(assert (=> b!200182 (=> (not res!95317) (not e!131296))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6089 0))(
  ( (V!6090 (val!2460 Int)) )
))
(declare-datatypes ((ValueCell!2072 0))(
  ( (ValueCellFull!2072 (v!4430 V!6089)) (EmptyCell!2072) )
))
(declare-datatypes ((array!8899 0))(
  ( (array!8900 (arr!4200 (Array (_ BitVec 32) ValueCell!2072)) (size!4525 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8899)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200182 (= res!95317 (and (= (size!4525 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4524 _keys!825) (size!4525 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200183 () Bool)

(declare-fun e!131295 () Bool)

(declare-fun e!131298 () Bool)

(declare-fun mapRes!8315 () Bool)

(assert (=> b!200183 (= e!131295 (and e!131298 mapRes!8315))))

(declare-fun condMapEmpty!8315 () Bool)

(declare-fun mapDefault!8315 () ValueCell!2072)

