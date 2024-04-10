; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82894 () Bool)

(assert start!82894)

(declare-fun b_free!19021 () Bool)

(declare-fun b_next!19021 () Bool)

(assert (=> start!82894 (= b_free!19021 (not b_next!19021))))

(declare-fun tp!66191 () Bool)

(declare-fun b_and!30509 () Bool)

(assert (=> start!82894 (= tp!66191 b_and!30509)))

(declare-fun b!967185 () Bool)

(declare-fun res!647434 () Bool)

(declare-fun e!545168 () Bool)

(assert (=> b!967185 (=> (not res!647434) (not e!545168))))

(declare-datatypes ((array!59733 0))(
  ( (array!59734 (arr!28735 (Array (_ BitVec 32) (_ BitVec 64))) (size!29214 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59733)

(declare-datatypes ((List!19949 0))(
  ( (Nil!19946) (Cons!19945 (h!21107 (_ BitVec 64)) (t!28312 List!19949)) )
))
(declare-fun arrayNoDuplicates!0 (array!59733 (_ BitVec 32) List!19949) Bool)

(assert (=> b!967185 (= res!647434 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19946))))

(declare-fun b!967186 () Bool)

(declare-fun res!647427 () Bool)

(assert (=> b!967186 (=> (not res!647427) (not e!545168))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967186 (= res!647427 (validKeyInArray!0 (select (arr!28735 _keys!1686) i!803)))))

(declare-fun b!967187 () Bool)

(declare-fun res!647430 () Bool)

(assert (=> b!967187 (=> (not res!647430) (not e!545168))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967187 (= res!647430 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967188 () Bool)

(declare-fun e!545167 () Bool)

(declare-fun tp_is_empty!21829 () Bool)

(assert (=> b!967188 (= e!545167 tp_is_empty!21829)))

(declare-fun b!967190 () Bool)

(declare-fun e!545169 () Bool)

(assert (=> b!967190 (= e!545169 tp_is_empty!21829)))

(declare-fun b!967191 () Bool)

(declare-fun res!647431 () Bool)

(assert (=> b!967191 (=> (not res!647431) (not e!545168))))

(assert (=> b!967191 (= res!647431 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29214 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29214 _keys!1686))))))

(declare-fun mapIsEmpty!34738 () Bool)

(declare-fun mapRes!34738 () Bool)

(assert (=> mapIsEmpty!34738 mapRes!34738))

(declare-fun b!967192 () Bool)

(declare-fun e!545170 () Bool)

(assert (=> b!967192 (= e!545170 (and e!545169 mapRes!34738))))

(declare-fun condMapEmpty!34738 () Bool)

(declare-datatypes ((V!34089 0))(
  ( (V!34090 (val!10965 Int)) )
))
(declare-datatypes ((ValueCell!10433 0))(
  ( (ValueCellFull!10433 (v!13523 V!34089)) (EmptyCell!10433) )
))
(declare-datatypes ((array!59735 0))(
  ( (array!59736 (arr!28736 (Array (_ BitVec 32) ValueCell!10433)) (size!29215 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59735)

(declare-fun mapDefault!34738 () ValueCell!10433)

