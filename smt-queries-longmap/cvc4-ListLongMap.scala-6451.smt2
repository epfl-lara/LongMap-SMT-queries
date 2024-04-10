; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82550 () Bool)

(assert start!82550)

(declare-fun b_free!18683 () Bool)

(declare-fun b_next!18683 () Bool)

(assert (=> start!82550 (= b_free!18683 (not b_next!18683))))

(declare-fun tp!65168 () Bool)

(declare-fun b_and!30171 () Bool)

(assert (=> start!82550 (= tp!65168 b_and!30171)))

(declare-fun b!962006 () Bool)

(declare-fun e!542507 () Bool)

(declare-fun tp_is_empty!21485 () Bool)

(assert (=> b!962006 (= e!542507 tp_is_empty!21485)))

(declare-fun mapNonEmpty!34222 () Bool)

(declare-fun mapRes!34222 () Bool)

(declare-fun tp!65169 () Bool)

(declare-fun e!542506 () Bool)

(assert (=> mapNonEmpty!34222 (= mapRes!34222 (and tp!65169 e!542506))))

(declare-datatypes ((V!33629 0))(
  ( (V!33630 (val!10793 Int)) )
))
(declare-datatypes ((ValueCell!10261 0))(
  ( (ValueCellFull!10261 (v!13351 V!33629)) (EmptyCell!10261) )
))
(declare-fun mapValue!34222 () ValueCell!10261)

(declare-fun mapRest!34222 () (Array (_ BitVec 32) ValueCell!10261))

(declare-datatypes ((array!59067 0))(
  ( (array!59068 (arr!28402 (Array (_ BitVec 32) ValueCell!10261)) (size!28881 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59067)

(declare-fun mapKey!34222 () (_ BitVec 32))

(assert (=> mapNonEmpty!34222 (= (arr!28402 _values!1400) (store mapRest!34222 mapKey!34222 mapValue!34222))))

(declare-fun b!962007 () Bool)

(assert (=> b!962007 (= e!542506 tp_is_empty!21485)))

(declare-fun b!962008 () Bool)

(declare-fun res!643800 () Bool)

(declare-fun e!542509 () Bool)

(assert (=> b!962008 (=> (not res!643800) (not e!542509))))

(declare-datatypes ((array!59069 0))(
  ( (array!59070 (arr!28403 (Array (_ BitVec 32) (_ BitVec 64))) (size!28882 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59069)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962008 (= res!643800 (validKeyInArray!0 (select (arr!28403 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34222 () Bool)

(assert (=> mapIsEmpty!34222 mapRes!34222))

(declare-fun res!643796 () Bool)

(assert (=> start!82550 (=> (not res!643796) (not e!542509))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82550 (= res!643796 (validMask!0 mask!2110))))

(assert (=> start!82550 e!542509))

(assert (=> start!82550 true))

(declare-fun e!542508 () Bool)

(declare-fun array_inv!22011 (array!59067) Bool)

(assert (=> start!82550 (and (array_inv!22011 _values!1400) e!542508)))

(declare-fun array_inv!22012 (array!59069) Bool)

(assert (=> start!82550 (array_inv!22012 _keys!1686)))

(assert (=> start!82550 tp!65168))

(assert (=> start!82550 tp_is_empty!21485))

(declare-fun b!962009 () Bool)

(assert (=> b!962009 (= e!542508 (and e!542507 mapRes!34222))))

(declare-fun condMapEmpty!34222 () Bool)

(declare-fun mapDefault!34222 () ValueCell!10261)

