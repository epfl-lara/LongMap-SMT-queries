; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35772 () Bool)

(assert start!35772)

(declare-fun b!359336 () Bool)

(declare-fun e!220063 () Bool)

(declare-fun tp_is_empty!8225 () Bool)

(assert (=> b!359336 (= e!220063 tp_is_empty!8225)))

(declare-fun b!359337 () Bool)

(declare-fun res!199728 () Bool)

(declare-fun e!220066 () Bool)

(assert (=> b!359337 (=> (not res!199728) (not e!220066))))

(declare-datatypes ((array!20009 0))(
  ( (array!20010 (arr!9498 (Array (_ BitVec 32) (_ BitVec 64))) (size!9850 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20009)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20009 (_ BitVec 32)) Bool)

(assert (=> b!359337 (= res!199728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359338 () Bool)

(assert (=> b!359338 (= e!220066 false)))

(declare-fun lt!166325 () Bool)

(declare-datatypes ((List!5464 0))(
  ( (Nil!5461) (Cons!5460 (h!6316 (_ BitVec 64)) (t!10614 List!5464)) )
))
(declare-fun arrayNoDuplicates!0 (array!20009 (_ BitVec 32) List!5464) Bool)

(assert (=> b!359338 (= lt!166325 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5461))))

(declare-fun mapIsEmpty!13845 () Bool)

(declare-fun mapRes!13845 () Bool)

(assert (=> mapIsEmpty!13845 mapRes!13845))

(declare-fun b!359339 () Bool)

(declare-fun e!220065 () Bool)

(declare-fun e!220067 () Bool)

(assert (=> b!359339 (= e!220065 (and e!220067 mapRes!13845))))

(declare-fun condMapEmpty!13845 () Bool)

(declare-datatypes ((V!11943 0))(
  ( (V!11944 (val!4157 Int)) )
))
(declare-datatypes ((ValueCell!3769 0))(
  ( (ValueCellFull!3769 (v!6351 V!11943)) (EmptyCell!3769) )
))
(declare-datatypes ((array!20011 0))(
  ( (array!20012 (arr!9499 (Array (_ BitVec 32) ValueCell!3769)) (size!9851 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20011)

(declare-fun mapDefault!13845 () ValueCell!3769)

