; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82868 () Bool)

(assert start!82868)

(declare-fun b_free!18995 () Bool)

(declare-fun b_next!18995 () Bool)

(assert (=> start!82868 (= b_free!18995 (not b_next!18995))))

(declare-fun tp!66113 () Bool)

(declare-fun b_and!30483 () Bool)

(assert (=> start!82868 (= tp!66113 b_and!30483)))

(declare-fun b!966758 () Bool)

(declare-fun e!544973 () Bool)

(declare-fun tp_is_empty!21803 () Bool)

(assert (=> b!966758 (= e!544973 tp_is_empty!21803)))

(declare-fun b!966759 () Bool)

(declare-fun e!544974 () Bool)

(assert (=> b!966759 (= e!544974 tp_is_empty!21803)))

(declare-fun b!966760 () Bool)

(declare-fun res!647120 () Bool)

(declare-fun e!544972 () Bool)

(assert (=> b!966760 (=> (not res!647120) (not e!544972))))

(declare-datatypes ((array!59683 0))(
  ( (array!59684 (arr!28710 (Array (_ BitVec 32) (_ BitVec 64))) (size!29189 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59683)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966760 (= res!647120 (validKeyInArray!0 (select (arr!28710 _keys!1686) i!803)))))

(declare-fun b!966761 () Bool)

(declare-fun res!647119 () Bool)

(assert (=> b!966761 (=> (not res!647119) (not e!544972))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59683 (_ BitVec 32)) Bool)

(assert (=> b!966761 (= res!647119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966762 () Bool)

(declare-fun res!647118 () Bool)

(assert (=> b!966762 (=> (not res!647118) (not e!544972))))

(declare-datatypes ((List!19931 0))(
  ( (Nil!19928) (Cons!19927 (h!21089 (_ BitVec 64)) (t!28294 List!19931)) )
))
(declare-fun arrayNoDuplicates!0 (array!59683 (_ BitVec 32) List!19931) Bool)

(assert (=> b!966762 (= res!647118 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19928))))

(declare-fun res!647117 () Bool)

(assert (=> start!82868 (=> (not res!647117) (not e!544972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82868 (= res!647117 (validMask!0 mask!2110))))

(assert (=> start!82868 e!544972))

(assert (=> start!82868 true))

(declare-datatypes ((V!34053 0))(
  ( (V!34054 (val!10952 Int)) )
))
(declare-datatypes ((ValueCell!10420 0))(
  ( (ValueCellFull!10420 (v!13510 V!34053)) (EmptyCell!10420) )
))
(declare-datatypes ((array!59685 0))(
  ( (array!59686 (arr!28711 (Array (_ BitVec 32) ValueCell!10420)) (size!29190 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59685)

(declare-fun e!544976 () Bool)

(declare-fun array_inv!22237 (array!59685) Bool)

(assert (=> start!82868 (and (array_inv!22237 _values!1400) e!544976)))

(declare-fun array_inv!22238 (array!59683) Bool)

(assert (=> start!82868 (array_inv!22238 _keys!1686)))

(assert (=> start!82868 tp!66113))

(assert (=> start!82868 tp_is_empty!21803))

(declare-fun mapIsEmpty!34699 () Bool)

(declare-fun mapRes!34699 () Bool)

(assert (=> mapIsEmpty!34699 mapRes!34699))

(declare-fun b!966763 () Bool)

(declare-fun res!647122 () Bool)

(assert (=> b!966763 (=> (not res!647122) (not e!544972))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966763 (= res!647122 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29189 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29189 _keys!1686))))))

(declare-fun b!966764 () Bool)

(declare-fun res!647121 () Bool)

(assert (=> b!966764 (=> (not res!647121) (not e!544972))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966764 (= res!647121 (and (= (size!29190 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29189 _keys!1686) (size!29190 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966765 () Bool)

(assert (=> b!966765 (= e!544976 (and e!544973 mapRes!34699))))

(declare-fun condMapEmpty!34699 () Bool)

(declare-fun mapDefault!34699 () ValueCell!10420)

