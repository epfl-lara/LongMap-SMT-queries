; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107006 () Bool)

(assert start!107006)

(declare-fun b!1268753 () Bool)

(declare-fun e!723048 () Bool)

(declare-fun tp_is_empty!32695 () Bool)

(assert (=> b!1268753 (= e!723048 tp_is_empty!32695)))

(declare-fun mapIsEmpty!50623 () Bool)

(declare-fun mapRes!50623 () Bool)

(assert (=> mapIsEmpty!50623 mapRes!50623))

(declare-fun b!1268754 () Bool)

(declare-fun res!844409 () Bool)

(declare-fun e!723044 () Bool)

(assert (=> b!1268754 (=> (not res!844409) (not e!723044))))

(declare-datatypes ((array!82660 0))(
  ( (array!82661 (arr!39867 (Array (_ BitVec 32) (_ BitVec 64))) (size!40403 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82660)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82660 (_ BitVec 32)) Bool)

(assert (=> b!1268754 (= res!844409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50623 () Bool)

(declare-fun tp!96802 () Bool)

(declare-fun e!723046 () Bool)

(assert (=> mapNonEmpty!50623 (= mapRes!50623 (and tp!96802 e!723046))))

(declare-datatypes ((V!48787 0))(
  ( (V!48788 (val!16422 Int)) )
))
(declare-datatypes ((ValueCell!15494 0))(
  ( (ValueCellFull!15494 (v!19059 V!48787)) (EmptyCell!15494) )
))
(declare-datatypes ((array!82662 0))(
  ( (array!82663 (arr!39868 (Array (_ BitVec 32) ValueCell!15494)) (size!40404 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82662)

(declare-fun mapKey!50623 () (_ BitVec 32))

(declare-fun mapRest!50623 () (Array (_ BitVec 32) ValueCell!15494))

(declare-fun mapValue!50623 () ValueCell!15494)

(assert (=> mapNonEmpty!50623 (= (arr!39868 _values!1134) (store mapRest!50623 mapKey!50623 mapValue!50623))))

(declare-fun b!1268755 () Bool)

(declare-fun e!723045 () Bool)

(assert (=> b!1268755 (= e!723045 (and e!723048 mapRes!50623))))

(declare-fun condMapEmpty!50623 () Bool)

(declare-fun mapDefault!50623 () ValueCell!15494)

