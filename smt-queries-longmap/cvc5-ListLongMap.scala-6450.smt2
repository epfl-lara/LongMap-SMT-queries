; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82540 () Bool)

(assert start!82540)

(declare-fun b_free!18673 () Bool)

(declare-fun b_next!18673 () Bool)

(assert (=> start!82540 (= b_free!18673 (not b_next!18673))))

(declare-fun tp!65138 () Bool)

(declare-fun b_and!30161 () Bool)

(assert (=> start!82540 (= tp!65138 b_and!30161)))

(declare-fun mapIsEmpty!34207 () Bool)

(declare-fun mapRes!34207 () Bool)

(assert (=> mapIsEmpty!34207 mapRes!34207))

(declare-fun b!961871 () Bool)

(declare-fun res!643711 () Bool)

(declare-fun e!542435 () Bool)

(assert (=> b!961871 (=> (not res!643711) (not e!542435))))

(declare-datatypes ((array!59047 0))(
  ( (array!59048 (arr!28392 (Array (_ BitVec 32) (_ BitVec 64))) (size!28871 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59047)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961871 (= res!643711 (validKeyInArray!0 (select (arr!28392 _keys!1686) i!803)))))

(declare-fun b!961872 () Bool)

(declare-fun res!643706 () Bool)

(assert (=> b!961872 (=> (not res!643706) (not e!542435))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59047 (_ BitVec 32)) Bool)

(assert (=> b!961872 (= res!643706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961873 () Bool)

(declare-fun res!643710 () Bool)

(assert (=> b!961873 (=> (not res!643710) (not e!542435))))

(declare-datatypes ((List!19705 0))(
  ( (Nil!19702) (Cons!19701 (h!20863 (_ BitVec 64)) (t!28068 List!19705)) )
))
(declare-fun arrayNoDuplicates!0 (array!59047 (_ BitVec 32) List!19705) Bool)

(assert (=> b!961873 (= res!643710 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19702))))

(declare-fun res!643707 () Bool)

(assert (=> start!82540 (=> (not res!643707) (not e!542435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82540 (= res!643707 (validMask!0 mask!2110))))

(assert (=> start!82540 e!542435))

(assert (=> start!82540 true))

(declare-datatypes ((V!33617 0))(
  ( (V!33618 (val!10788 Int)) )
))
(declare-datatypes ((ValueCell!10256 0))(
  ( (ValueCellFull!10256 (v!13346 V!33617)) (EmptyCell!10256) )
))
(declare-datatypes ((array!59049 0))(
  ( (array!59050 (arr!28393 (Array (_ BitVec 32) ValueCell!10256)) (size!28872 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59049)

(declare-fun e!542433 () Bool)

(declare-fun array_inv!22001 (array!59049) Bool)

(assert (=> start!82540 (and (array_inv!22001 _values!1400) e!542433)))

(declare-fun array_inv!22002 (array!59047) Bool)

(assert (=> start!82540 (array_inv!22002 _keys!1686)))

(assert (=> start!82540 tp!65138))

(declare-fun tp_is_empty!21475 () Bool)

(assert (=> start!82540 tp_is_empty!21475))

(declare-fun b!961874 () Bool)

(declare-fun e!542431 () Bool)

(assert (=> b!961874 (= e!542433 (and e!542431 mapRes!34207))))

(declare-fun condMapEmpty!34207 () Bool)

(declare-fun mapDefault!34207 () ValueCell!10256)

