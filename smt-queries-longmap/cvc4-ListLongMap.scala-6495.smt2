; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82814 () Bool)

(assert start!82814)

(declare-fun b_free!18941 () Bool)

(declare-fun b_next!18941 () Bool)

(assert (=> start!82814 (= b_free!18941 (not b_next!18941))))

(declare-fun tp!65951 () Bool)

(declare-fun b_and!30429 () Bool)

(assert (=> start!82814 (= tp!65951 b_and!30429)))

(declare-fun res!646625 () Bool)

(declare-fun e!544569 () Bool)

(assert (=> start!82814 (=> (not res!646625) (not e!544569))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82814 (= res!646625 (validMask!0 mask!2110))))

(assert (=> start!82814 e!544569))

(assert (=> start!82814 true))

(declare-datatypes ((V!33981 0))(
  ( (V!33982 (val!10925 Int)) )
))
(declare-datatypes ((ValueCell!10393 0))(
  ( (ValueCellFull!10393 (v!13483 V!33981)) (EmptyCell!10393) )
))
(declare-datatypes ((array!59583 0))(
  ( (array!59584 (arr!28660 (Array (_ BitVec 32) ValueCell!10393)) (size!29139 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59583)

(declare-fun e!544567 () Bool)

(declare-fun array_inv!22199 (array!59583) Bool)

(assert (=> start!82814 (and (array_inv!22199 _values!1400) e!544567)))

(declare-datatypes ((array!59585 0))(
  ( (array!59586 (arr!28661 (Array (_ BitVec 32) (_ BitVec 64))) (size!29140 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59585)

(declare-fun array_inv!22200 (array!59585) Bool)

(assert (=> start!82814 (array_inv!22200 _keys!1686)))

(assert (=> start!82814 tp!65951))

(declare-fun tp_is_empty!21749 () Bool)

(assert (=> start!82814 tp_is_empty!21749))

(declare-fun b!966020 () Bool)

(declare-fun e!544571 () Bool)

(assert (=> b!966020 (= e!544571 tp_is_empty!21749)))

(declare-fun b!966021 () Bool)

(declare-fun res!646623 () Bool)

(assert (=> b!966021 (=> (not res!646623) (not e!544569))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966021 (= res!646623 (validKeyInArray!0 (select (arr!28661 _keys!1686) i!803)))))

(declare-fun b!966022 () Bool)

(declare-fun e!544570 () Bool)

(declare-fun mapRes!34618 () Bool)

(assert (=> b!966022 (= e!544567 (and e!544570 mapRes!34618))))

(declare-fun condMapEmpty!34618 () Bool)

(declare-fun mapDefault!34618 () ValueCell!10393)

