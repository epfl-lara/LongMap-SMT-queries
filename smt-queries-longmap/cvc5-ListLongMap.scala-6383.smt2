; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82050 () Bool)

(assert start!82050)

(declare-fun b!956893 () Bool)

(declare-fun e!539226 () Bool)

(declare-fun tp_is_empty!21073 () Bool)

(assert (=> b!956893 (= e!539226 tp_is_empty!21073)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun b!956894 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun e!539228 () Bool)

(declare-datatypes ((array!58245 0))(
  ( (array!58246 (arr!28001 (Array (_ BitVec 32) (_ BitVec 64))) (size!28480 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58245)

(declare-datatypes ((V!33081 0))(
  ( (V!33082 (val!10587 Int)) )
))
(declare-datatypes ((ValueCell!10055 0))(
  ( (ValueCellFull!10055 (v!13143 V!33081)) (EmptyCell!10055) )
))
(declare-datatypes ((array!58247 0))(
  ( (array!58248 (arr!28002 (Array (_ BitVec 32) ValueCell!10055)) (size!28481 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58247)

(assert (=> b!956894 (= e!539228 (and (= (size!28481 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28480 _keys!1668) (size!28481 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (not (= (size!28480 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)))))))

(declare-fun mapIsEmpty!33574 () Bool)

(declare-fun mapRes!33574 () Bool)

(assert (=> mapIsEmpty!33574 mapRes!33574))

(declare-fun mapNonEmpty!33574 () Bool)

(declare-fun tp!64179 () Bool)

(declare-fun e!539229 () Bool)

(assert (=> mapNonEmpty!33574 (= mapRes!33574 (and tp!64179 e!539229))))

(declare-fun mapRest!33574 () (Array (_ BitVec 32) ValueCell!10055))

(declare-fun mapValue!33574 () ValueCell!10055)

(declare-fun mapKey!33574 () (_ BitVec 32))

(assert (=> mapNonEmpty!33574 (= (arr!28002 _values!1386) (store mapRest!33574 mapKey!33574 mapValue!33574))))

(declare-fun b!956896 () Bool)

(declare-fun e!539227 () Bool)

(assert (=> b!956896 (= e!539227 (and e!539226 mapRes!33574))))

(declare-fun condMapEmpty!33574 () Bool)

(declare-fun mapDefault!33574 () ValueCell!10055)

