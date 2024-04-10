; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82178 () Bool)

(assert start!82178)

(declare-fun b!957767 () Bool)

(declare-fun res!641101 () Bool)

(declare-fun e!539954 () Bool)

(assert (=> b!957767 (=> (not res!641101) (not e!539954))))

(declare-datatypes ((array!58417 0))(
  ( (array!58418 (arr!28082 (Array (_ BitVec 32) (_ BitVec 64))) (size!28561 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58417)

(declare-datatypes ((List!19523 0))(
  ( (Nil!19520) (Cons!19519 (h!20681 (_ BitVec 64)) (t!27886 List!19523)) )
))
(declare-fun arrayNoDuplicates!0 (array!58417 (_ BitVec 32) List!19523) Bool)

(assert (=> b!957767 (= res!641101 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19520))))

(declare-fun b!957768 () Bool)

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957768 (= e!539954 (bvsgt from!2064 (size!28561 _keys!1668)))))

(declare-fun b!957769 () Bool)

(declare-fun e!539952 () Bool)

(declare-fun tp_is_empty!21157 () Bool)

(assert (=> b!957769 (= e!539952 tp_is_empty!21157)))

(declare-fun mapIsEmpty!33715 () Bool)

(declare-fun mapRes!33715 () Bool)

(assert (=> mapIsEmpty!33715 mapRes!33715))

(declare-fun b!957770 () Bool)

(declare-fun res!641098 () Bool)

(assert (=> b!957770 (=> (not res!641098) (not e!539954))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33193 0))(
  ( (V!33194 (val!10629 Int)) )
))
(declare-datatypes ((ValueCell!10097 0))(
  ( (ValueCellFull!10097 (v!13186 V!33193)) (EmptyCell!10097) )
))
(declare-datatypes ((array!58419 0))(
  ( (array!58420 (arr!28083 (Array (_ BitVec 32) ValueCell!10097)) (size!28562 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58419)

(assert (=> b!957770 (= res!641098 (and (= (size!28562 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28561 _keys!1668) (size!28562 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!641099 () Bool)

(assert (=> start!82178 (=> (not res!641099) (not e!539954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82178 (= res!641099 (validMask!0 mask!2088))))

(assert (=> start!82178 e!539954))

(assert (=> start!82178 true))

(declare-fun array_inv!21781 (array!58417) Bool)

(assert (=> start!82178 (array_inv!21781 _keys!1668)))

(declare-fun e!539955 () Bool)

(declare-fun array_inv!21782 (array!58419) Bool)

(assert (=> start!82178 (and (array_inv!21782 _values!1386) e!539955)))

(declare-fun b!957771 () Bool)

(declare-fun res!641100 () Bool)

(assert (=> b!957771 (=> (not res!641100) (not e!539954))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957771 (= res!641100 (validKeyInArray!0 (select (arr!28082 _keys!1668) i!793)))))

(declare-fun b!957772 () Bool)

(declare-fun e!539951 () Bool)

(assert (=> b!957772 (= e!539955 (and e!539951 mapRes!33715))))

(declare-fun condMapEmpty!33715 () Bool)

(declare-fun mapDefault!33715 () ValueCell!10097)

