; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82810 () Bool)

(assert start!82810)

(declare-fun b_free!18937 () Bool)

(declare-fun b_next!18937 () Bool)

(assert (=> start!82810 (= b_free!18937 (not b_next!18937))))

(declare-fun tp!65940 () Bool)

(declare-fun b_and!30425 () Bool)

(assert (=> start!82810 (= tp!65940 b_and!30425)))

(declare-fun b!965966 () Bool)

(declare-fun e!544541 () Bool)

(declare-fun tp_is_empty!21745 () Bool)

(assert (=> b!965966 (= e!544541 tp_is_empty!21745)))

(declare-fun b!965967 () Bool)

(declare-fun res!646590 () Bool)

(declare-fun e!544538 () Bool)

(assert (=> b!965967 (=> (not res!646590) (not e!544538))))

(declare-datatypes ((array!59575 0))(
  ( (array!59576 (arr!28656 (Array (_ BitVec 32) (_ BitVec 64))) (size!29135 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59575)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59575 (_ BitVec 32)) Bool)

(assert (=> b!965967 (= res!646590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965968 () Bool)

(declare-fun res!646587 () Bool)

(assert (=> b!965968 (=> (not res!646587) (not e!544538))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965968 (= res!646587 (validKeyInArray!0 (select (arr!28656 _keys!1686) i!803)))))

(declare-fun b!965969 () Bool)

(declare-fun e!544539 () Bool)

(assert (=> b!965969 (= e!544539 tp_is_empty!21745)))

(declare-fun res!646591 () Bool)

(assert (=> start!82810 (=> (not res!646591) (not e!544538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82810 (= res!646591 (validMask!0 mask!2110))))

(assert (=> start!82810 e!544538))

(assert (=> start!82810 true))

(declare-datatypes ((V!33977 0))(
  ( (V!33978 (val!10923 Int)) )
))
(declare-datatypes ((ValueCell!10391 0))(
  ( (ValueCellFull!10391 (v!13481 V!33977)) (EmptyCell!10391) )
))
(declare-datatypes ((array!59577 0))(
  ( (array!59578 (arr!28657 (Array (_ BitVec 32) ValueCell!10391)) (size!29136 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59577)

(declare-fun e!544537 () Bool)

(declare-fun array_inv!22195 (array!59577) Bool)

(assert (=> start!82810 (and (array_inv!22195 _values!1400) e!544537)))

(declare-fun array_inv!22196 (array!59575) Bool)

(assert (=> start!82810 (array_inv!22196 _keys!1686)))

(assert (=> start!82810 tp!65940))

(assert (=> start!82810 tp_is_empty!21745))

(declare-fun b!965970 () Bool)

(declare-fun res!646589 () Bool)

(assert (=> b!965970 (=> (not res!646589) (not e!544538))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965970 (= res!646589 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29135 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29135 _keys!1686))))))

(declare-fun mapIsEmpty!34612 () Bool)

(declare-fun mapRes!34612 () Bool)

(assert (=> mapIsEmpty!34612 mapRes!34612))

(declare-fun b!965971 () Bool)

(assert (=> b!965971 (= e!544537 (and e!544541 mapRes!34612))))

(declare-fun condMapEmpty!34612 () Bool)

(declare-fun mapDefault!34612 () ValueCell!10391)

