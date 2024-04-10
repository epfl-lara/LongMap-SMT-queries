; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38960 () Bool)

(assert start!38960)

(declare-fun b!407912 () Bool)

(declare-fun res!235909 () Bool)

(declare-fun e!244920 () Bool)

(assert (=> b!407912 (=> (not res!235909) (not e!244920))))

(declare-datatypes ((array!24639 0))(
  ( (array!24640 (arr!11769 (Array (_ BitVec 32) (_ BitVec 64))) (size!12121 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24639)

(declare-datatypes ((List!6824 0))(
  ( (Nil!6821) (Cons!6820 (h!7676 (_ BitVec 64)) (t!11998 List!6824)) )
))
(declare-fun arrayNoDuplicates!0 (array!24639 (_ BitVec 32) List!6824) Bool)

(assert (=> b!407912 (= res!235909 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6821))))

(declare-fun b!407913 () Bool)

(declare-fun res!235913 () Bool)

(assert (=> b!407913 (=> (not res!235913) (not e!244920))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407913 (= res!235913 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12121 _keys!709))))))

(declare-fun b!407914 () Bool)

(declare-fun res!235911 () Bool)

(assert (=> b!407914 (=> (not res!235911) (not e!244920))))

(assert (=> b!407914 (= res!235911 (or (= (select (arr!11769 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11769 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407915 () Bool)

(declare-fun e!244918 () Bool)

(declare-fun e!244919 () Bool)

(declare-fun mapRes!17190 () Bool)

(assert (=> b!407915 (= e!244918 (and e!244919 mapRes!17190))))

(declare-fun condMapEmpty!17190 () Bool)

(declare-datatypes ((V!14943 0))(
  ( (V!14944 (val!5234 Int)) )
))
(declare-datatypes ((ValueCell!4846 0))(
  ( (ValueCellFull!4846 (v!7481 V!14943)) (EmptyCell!4846) )
))
(declare-datatypes ((array!24641 0))(
  ( (array!24642 (arr!11770 (Array (_ BitVec 32) ValueCell!4846)) (size!12122 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24641)

(declare-fun mapDefault!17190 () ValueCell!4846)

