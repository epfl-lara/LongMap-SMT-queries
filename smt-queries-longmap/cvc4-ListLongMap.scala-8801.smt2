; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107034 () Bool)

(assert start!107034)

(declare-fun b!1269005 () Bool)

(declare-fun res!844534 () Bool)

(declare-fun e!723255 () Bool)

(assert (=> b!1269005 (=> (not res!844534) (not e!723255))))

(declare-datatypes ((array!82712 0))(
  ( (array!82713 (arr!39893 (Array (_ BitVec 32) (_ BitVec 64))) (size!40429 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82712)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82712 (_ BitVec 32)) Bool)

(assert (=> b!1269005 (= res!844534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50665 () Bool)

(declare-fun mapRes!50665 () Bool)

(declare-fun tp!96844 () Bool)

(declare-fun e!723254 () Bool)

(assert (=> mapNonEmpty!50665 (= mapRes!50665 (and tp!96844 e!723254))))

(declare-datatypes ((V!48823 0))(
  ( (V!48824 (val!16436 Int)) )
))
(declare-datatypes ((ValueCell!15508 0))(
  ( (ValueCellFull!15508 (v!19073 V!48823)) (EmptyCell!15508) )
))
(declare-datatypes ((array!82714 0))(
  ( (array!82715 (arr!39894 (Array (_ BitVec 32) ValueCell!15508)) (size!40430 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82714)

(declare-fun mapValue!50665 () ValueCell!15508)

(declare-fun mapRest!50665 () (Array (_ BitVec 32) ValueCell!15508))

(declare-fun mapKey!50665 () (_ BitVec 32))

(assert (=> mapNonEmpty!50665 (= (arr!39894 _values!1134) (store mapRest!50665 mapKey!50665 mapValue!50665))))

(declare-fun b!1269006 () Bool)

(declare-fun res!844533 () Bool)

(assert (=> b!1269006 (=> (not res!844533) (not e!723255))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269006 (= res!844533 (and (= (size!40430 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40429 _keys!1364) (size!40430 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269007 () Bool)

(declare-fun e!723256 () Bool)

(declare-fun tp_is_empty!32723 () Bool)

(assert (=> b!1269007 (= e!723256 tp_is_empty!32723)))

(declare-fun b!1269009 () Bool)

(assert (=> b!1269009 (= e!723255 false)))

(declare-fun lt!574521 () Bool)

(declare-datatypes ((List!28403 0))(
  ( (Nil!28400) (Cons!28399 (h!29608 (_ BitVec 64)) (t!41932 List!28403)) )
))
(declare-fun arrayNoDuplicates!0 (array!82712 (_ BitVec 32) List!28403) Bool)

(assert (=> b!1269009 (= lt!574521 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28400))))

(declare-fun b!1269008 () Bool)

(declare-fun e!723257 () Bool)

(assert (=> b!1269008 (= e!723257 (and e!723256 mapRes!50665))))

(declare-fun condMapEmpty!50665 () Bool)

(declare-fun mapDefault!50665 () ValueCell!15508)

