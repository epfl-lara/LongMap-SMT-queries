; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82140 () Bool)

(assert start!82140)

(declare-fun mapIsEmpty!33658 () Bool)

(declare-fun mapRes!33658 () Bool)

(assert (=> mapIsEmpty!33658 mapRes!33658))

(declare-fun b!957419 () Bool)

(declare-fun e!539668 () Bool)

(assert (=> b!957419 (= e!539668 false)))

(declare-fun lt!430320 () Bool)

(declare-datatypes ((array!58343 0))(
  ( (array!58344 (arr!28045 (Array (_ BitVec 32) (_ BitVec 64))) (size!28524 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58343)

(declare-datatypes ((List!19509 0))(
  ( (Nil!19506) (Cons!19505 (h!20667 (_ BitVec 64)) (t!27872 List!19509)) )
))
(declare-fun arrayNoDuplicates!0 (array!58343 (_ BitVec 32) List!19509) Bool)

(assert (=> b!957419 (= lt!430320 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19506))))

(declare-fun b!957420 () Bool)

(declare-fun res!640920 () Bool)

(assert (=> b!957420 (=> (not res!640920) (not e!539668))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58343 (_ BitVec 32)) Bool)

(assert (=> b!957420 (= res!640920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33658 () Bool)

(declare-fun tp!64263 () Bool)

(declare-fun e!539666 () Bool)

(assert (=> mapNonEmpty!33658 (= mapRes!33658 (and tp!64263 e!539666))))

(declare-datatypes ((V!33141 0))(
  ( (V!33142 (val!10610 Int)) )
))
(declare-datatypes ((ValueCell!10078 0))(
  ( (ValueCellFull!10078 (v!13167 V!33141)) (EmptyCell!10078) )
))
(declare-fun mapValue!33658 () ValueCell!10078)

(declare-fun mapKey!33658 () (_ BitVec 32))

(declare-fun mapRest!33658 () (Array (_ BitVec 32) ValueCell!10078))

(declare-datatypes ((array!58345 0))(
  ( (array!58346 (arr!28046 (Array (_ BitVec 32) ValueCell!10078)) (size!28525 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58345)

(assert (=> mapNonEmpty!33658 (= (arr!28046 _values!1386) (store mapRest!33658 mapKey!33658 mapValue!33658))))

(declare-fun b!957422 () Bool)

(declare-fun e!539667 () Bool)

(declare-fun tp_is_empty!21119 () Bool)

(assert (=> b!957422 (= e!539667 tp_is_empty!21119)))

(declare-fun b!957423 () Bool)

(declare-fun e!539670 () Bool)

(assert (=> b!957423 (= e!539670 (and e!539667 mapRes!33658))))

(declare-fun condMapEmpty!33658 () Bool)

(declare-fun mapDefault!33658 () ValueCell!10078)

