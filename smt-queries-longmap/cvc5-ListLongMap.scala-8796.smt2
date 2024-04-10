; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107000 () Bool)

(assert start!107000)

(declare-fun mapIsEmpty!50614 () Bool)

(declare-fun mapRes!50614 () Bool)

(assert (=> mapIsEmpty!50614 mapRes!50614))

(declare-fun b!1268699 () Bool)

(declare-fun e!723002 () Bool)

(declare-fun tp_is_empty!32689 () Bool)

(assert (=> b!1268699 (= e!723002 tp_is_empty!32689)))

(declare-fun b!1268700 () Bool)

(declare-fun e!723001 () Bool)

(assert (=> b!1268700 (= e!723001 false)))

(declare-fun lt!574470 () Bool)

(declare-datatypes ((array!82648 0))(
  ( (array!82649 (arr!39861 (Array (_ BitVec 32) (_ BitVec 64))) (size!40397 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82648)

(declare-datatypes ((List!28391 0))(
  ( (Nil!28388) (Cons!28387 (h!29596 (_ BitVec 64)) (t!41920 List!28391)) )
))
(declare-fun arrayNoDuplicates!0 (array!82648 (_ BitVec 32) List!28391) Bool)

(assert (=> b!1268700 (= lt!574470 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28388))))

(declare-fun res!844380 () Bool)

(assert (=> start!107000 (=> (not res!844380) (not e!723001))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107000 (= res!844380 (validMask!0 mask!1730))))

(assert (=> start!107000 e!723001))

(declare-datatypes ((V!48779 0))(
  ( (V!48780 (val!16419 Int)) )
))
(declare-datatypes ((ValueCell!15491 0))(
  ( (ValueCellFull!15491 (v!19056 V!48779)) (EmptyCell!15491) )
))
(declare-datatypes ((array!82650 0))(
  ( (array!82651 (arr!39862 (Array (_ BitVec 32) ValueCell!15491)) (size!40398 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82650)

(declare-fun e!722999 () Bool)

(declare-fun array_inv!30329 (array!82650) Bool)

(assert (=> start!107000 (and (array_inv!30329 _values!1134) e!722999)))

(assert (=> start!107000 true))

(declare-fun array_inv!30330 (array!82648) Bool)

(assert (=> start!107000 (array_inv!30330 _keys!1364)))

(declare-fun b!1268701 () Bool)

(declare-fun res!844381 () Bool)

(assert (=> b!1268701 (=> (not res!844381) (not e!723001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82648 (_ BitVec 32)) Bool)

(assert (=> b!1268701 (= res!844381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268702 () Bool)

(assert (=> b!1268702 (= e!722999 (and e!723002 mapRes!50614))))

(declare-fun condMapEmpty!50614 () Bool)

(declare-fun mapDefault!50614 () ValueCell!15491)

