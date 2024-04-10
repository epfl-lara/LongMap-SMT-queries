; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81836 () Bool)

(assert start!81836)

(declare-fun b_free!18331 () Bool)

(declare-fun b_next!18331 () Bool)

(assert (=> start!81836 (= b_free!18331 (not b_next!18331))))

(declare-fun tp!63692 () Bool)

(declare-fun b_and!29817 () Bool)

(assert (=> start!81836 (= tp!63692 b_and!29817)))

(declare-fun mapIsEmpty!33274 () Bool)

(declare-fun mapRes!33274 () Bool)

(assert (=> mapIsEmpty!33274 mapRes!33274))

(declare-fun b!954346 () Bool)

(declare-fun res!639074 () Bool)

(declare-fun e!537670 () Bool)

(assert (=> b!954346 (=> (not res!639074) (not e!537670))))

(declare-datatypes ((array!57863 0))(
  ( (array!57864 (arr!27811 (Array (_ BitVec 32) (_ BitVec 64))) (size!28290 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57863)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954346 (= res!639074 (validKeyInArray!0 (select (arr!27811 _keys!1441) i!735)))))

(declare-fun b!954347 () Bool)

(declare-fun res!639078 () Bool)

(assert (=> b!954347 (=> (not res!639078) (not e!537670))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57863 (_ BitVec 32)) Bool)

(assert (=> b!954347 (= res!639078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954348 () Bool)

(declare-fun res!639075 () Bool)

(assert (=> b!954348 (=> (not res!639075) (not e!537670))))

(declare-datatypes ((List!19393 0))(
  ( (Nil!19390) (Cons!19389 (h!20551 (_ BitVec 64)) (t!27754 List!19393)) )
))
(declare-fun arrayNoDuplicates!0 (array!57863 (_ BitVec 32) List!19393) Bool)

(assert (=> b!954348 (= res!639075 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19390))))

(declare-fun res!639077 () Bool)

(assert (=> start!81836 (=> (not res!639077) (not e!537670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81836 (= res!639077 (validMask!0 mask!1823))))

(assert (=> start!81836 e!537670))

(assert (=> start!81836 true))

(declare-fun tp_is_empty!20875 () Bool)

(assert (=> start!81836 tp_is_empty!20875))

(declare-fun array_inv!21591 (array!57863) Bool)

(assert (=> start!81836 (array_inv!21591 _keys!1441)))

(declare-datatypes ((V!32817 0))(
  ( (V!32818 (val!10488 Int)) )
))
(declare-datatypes ((ValueCell!9956 0))(
  ( (ValueCellFull!9956 (v!13043 V!32817)) (EmptyCell!9956) )
))
(declare-datatypes ((array!57865 0))(
  ( (array!57866 (arr!27812 (Array (_ BitVec 32) ValueCell!9956)) (size!28291 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57865)

(declare-fun e!537671 () Bool)

(declare-fun array_inv!21592 (array!57865) Bool)

(assert (=> start!81836 (and (array_inv!21592 _values!1197) e!537671)))

(assert (=> start!81836 tp!63692))

(declare-fun b!954349 () Bool)

(declare-fun res!639073 () Bool)

(assert (=> b!954349 (=> (not res!639073) (not e!537670))))

(assert (=> b!954349 (= res!639073 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28290 _keys!1441))))))

(declare-fun b!954350 () Bool)

(declare-fun res!639076 () Bool)

(assert (=> b!954350 (=> (not res!639076) (not e!537670))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954350 (= res!639076 (and (= (size!28291 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28290 _keys!1441) (size!28291 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954351 () Bool)

(declare-fun e!537669 () Bool)

(assert (=> b!954351 (= e!537671 (and e!537669 mapRes!33274))))

(declare-fun condMapEmpty!33274 () Bool)

(declare-fun mapDefault!33274 () ValueCell!9956)

