; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82170 () Bool)

(assert start!82170)

(declare-fun res!641057 () Bool)

(declare-fun e!539891 () Bool)

(assert (=> start!82170 (=> (not res!641057) (not e!539891))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82170 (= res!641057 (validMask!0 mask!2088))))

(assert (=> start!82170 e!539891))

(assert (=> start!82170 true))

(declare-datatypes ((V!33181 0))(
  ( (V!33182 (val!10625 Int)) )
))
(declare-datatypes ((ValueCell!10093 0))(
  ( (ValueCellFull!10093 (v!13182 V!33181)) (EmptyCell!10093) )
))
(declare-datatypes ((array!58401 0))(
  ( (array!58402 (arr!28074 (Array (_ BitVec 32) ValueCell!10093)) (size!28553 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58401)

(declare-fun e!539894 () Bool)

(declare-fun array_inv!21775 (array!58401) Bool)

(assert (=> start!82170 (and (array_inv!21775 _values!1386) e!539894)))

(declare-datatypes ((array!58403 0))(
  ( (array!58404 (arr!28075 (Array (_ BitVec 32) (_ BitVec 64))) (size!28554 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58403)

(declare-fun array_inv!21776 (array!58403) Bool)

(assert (=> start!82170 (array_inv!21776 _keys!1668)))

(declare-fun b!957689 () Bool)

(declare-fun res!641055 () Bool)

(assert (=> b!957689 (=> (not res!641055) (not e!539891))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957689 (= res!641055 (and (= (size!28553 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28554 _keys!1668) (size!28553 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957690 () Bool)

(declare-fun e!539892 () Bool)

(declare-fun tp_is_empty!21149 () Bool)

(assert (=> b!957690 (= e!539892 tp_is_empty!21149)))

(declare-fun mapIsEmpty!33703 () Bool)

(declare-fun mapRes!33703 () Bool)

(assert (=> mapIsEmpty!33703 mapRes!33703))

(declare-fun b!957691 () Bool)

(declare-fun res!641056 () Bool)

(assert (=> b!957691 (=> (not res!641056) (not e!539891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58403 (_ BitVec 32)) Bool)

(assert (=> b!957691 (= res!641056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957692 () Bool)

(declare-fun e!539895 () Bool)

(assert (=> b!957692 (= e!539895 tp_is_empty!21149)))

(declare-fun b!957693 () Bool)

(assert (=> b!957693 (= e!539894 (and e!539892 mapRes!33703))))

(declare-fun condMapEmpty!33703 () Bool)

(declare-fun mapDefault!33703 () ValueCell!10093)

