; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82146 () Bool)

(assert start!82146)

(declare-fun b!957473 () Bool)

(declare-fun e!539714 () Bool)

(assert (=> b!957473 (= e!539714 false)))

(declare-fun lt!430329 () Bool)

(declare-datatypes ((array!58355 0))(
  ( (array!58356 (arr!28051 (Array (_ BitVec 32) (_ BitVec 64))) (size!28530 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58355)

(declare-datatypes ((List!19512 0))(
  ( (Nil!19509) (Cons!19508 (h!20670 (_ BitVec 64)) (t!27875 List!19512)) )
))
(declare-fun arrayNoDuplicates!0 (array!58355 (_ BitVec 32) List!19512) Bool)

(assert (=> b!957473 (= lt!430329 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19509))))

(declare-fun mapNonEmpty!33667 () Bool)

(declare-fun mapRes!33667 () Bool)

(declare-fun tp!64272 () Bool)

(declare-fun e!539711 () Bool)

(assert (=> mapNonEmpty!33667 (= mapRes!33667 (and tp!64272 e!539711))))

(declare-datatypes ((V!33149 0))(
  ( (V!33150 (val!10613 Int)) )
))
(declare-datatypes ((ValueCell!10081 0))(
  ( (ValueCellFull!10081 (v!13170 V!33149)) (EmptyCell!10081) )
))
(declare-fun mapValue!33667 () ValueCell!10081)

(declare-fun mapRest!33667 () (Array (_ BitVec 32) ValueCell!10081))

(declare-datatypes ((array!58357 0))(
  ( (array!58358 (arr!28052 (Array (_ BitVec 32) ValueCell!10081)) (size!28531 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58357)

(declare-fun mapKey!33667 () (_ BitVec 32))

(assert (=> mapNonEmpty!33667 (= (arr!28052 _values!1386) (store mapRest!33667 mapKey!33667 mapValue!33667))))

(declare-fun b!957474 () Bool)

(declare-fun e!539712 () Bool)

(declare-fun tp_is_empty!21125 () Bool)

(assert (=> b!957474 (= e!539712 tp_is_empty!21125)))

(declare-fun b!957475 () Bool)

(declare-fun res!640947 () Bool)

(assert (=> b!957475 (=> (not res!640947) (not e!539714))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957475 (= res!640947 (and (= (size!28531 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28530 _keys!1668) (size!28531 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!640949 () Bool)

(assert (=> start!82146 (=> (not res!640949) (not e!539714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82146 (= res!640949 (validMask!0 mask!2088))))

(assert (=> start!82146 e!539714))

(assert (=> start!82146 true))

(declare-fun e!539715 () Bool)

(declare-fun array_inv!21761 (array!58357) Bool)

(assert (=> start!82146 (and (array_inv!21761 _values!1386) e!539715)))

(declare-fun array_inv!21762 (array!58355) Bool)

(assert (=> start!82146 (array_inv!21762 _keys!1668)))

(declare-fun mapIsEmpty!33667 () Bool)

(assert (=> mapIsEmpty!33667 mapRes!33667))

(declare-fun b!957476 () Bool)

(declare-fun res!640948 () Bool)

(assert (=> b!957476 (=> (not res!640948) (not e!539714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58355 (_ BitVec 32)) Bool)

(assert (=> b!957476 (= res!640948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957477 () Bool)

(assert (=> b!957477 (= e!539711 tp_is_empty!21125)))

(declare-fun b!957478 () Bool)

(assert (=> b!957478 (= e!539715 (and e!539712 mapRes!33667))))

(declare-fun condMapEmpty!33667 () Bool)

(declare-fun mapDefault!33667 () ValueCell!10081)

