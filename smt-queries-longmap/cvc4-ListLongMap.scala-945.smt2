; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20770 () Bool)

(assert start!20770)

(declare-fun b_free!5429 () Bool)

(declare-fun b_next!5429 () Bool)

(assert (=> start!20770 (= b_free!5429 (not b_next!5429))))

(declare-fun tp!19318 () Bool)

(declare-fun b_and!12175 () Bool)

(assert (=> start!20770 (= tp!19318 b_and!12175)))

(declare-fun b!208046 () Bool)

(declare-fun res!101131 () Bool)

(declare-fun e!135731 () Bool)

(assert (=> b!208046 (=> (not res!101131) (not e!135731))))

(declare-datatypes ((array!9775 0))(
  ( (array!9776 (arr!4638 (Array (_ BitVec 32) (_ BitVec 64))) (size!4963 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9775)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208046 (= res!101131 (= (select (arr!4638 _keys!825) i!601) k!843))))

(declare-fun b!208047 () Bool)

(declare-fun e!135730 () Bool)

(declare-fun tp_is_empty!5285 () Bool)

(assert (=> b!208047 (= e!135730 tp_is_empty!5285)))

(declare-fun b!208048 () Bool)

(declare-fun res!101133 () Bool)

(assert (=> b!208048 (=> (not res!101133) (not e!135731))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9775 (_ BitVec 32)) Bool)

(assert (=> b!208048 (= res!101133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208049 () Bool)

(declare-fun e!135733 () Bool)

(assert (=> b!208049 (= e!135733 tp_is_empty!5285)))

(declare-fun mapIsEmpty!8996 () Bool)

(declare-fun mapRes!8996 () Bool)

(assert (=> mapIsEmpty!8996 mapRes!8996))

(declare-fun res!101137 () Bool)

(assert (=> start!20770 (=> (not res!101137) (not e!135731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20770 (= res!101137 (validMask!0 mask!1149))))

(assert (=> start!20770 e!135731))

(declare-datatypes ((V!6693 0))(
  ( (V!6694 (val!2687 Int)) )
))
(declare-datatypes ((ValueCell!2299 0))(
  ( (ValueCellFull!2299 (v!4657 V!6693)) (EmptyCell!2299) )
))
(declare-datatypes ((array!9777 0))(
  ( (array!9778 (arr!4639 (Array (_ BitVec 32) ValueCell!2299)) (size!4964 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9777)

(declare-fun e!135732 () Bool)

(declare-fun array_inv!3075 (array!9777) Bool)

(assert (=> start!20770 (and (array_inv!3075 _values!649) e!135732)))

(assert (=> start!20770 true))

(assert (=> start!20770 tp_is_empty!5285))

(declare-fun array_inv!3076 (array!9775) Bool)

(assert (=> start!20770 (array_inv!3076 _keys!825)))

(assert (=> start!20770 tp!19318))

(declare-fun mapNonEmpty!8996 () Bool)

(declare-fun tp!19319 () Bool)

(assert (=> mapNonEmpty!8996 (= mapRes!8996 (and tp!19319 e!135730))))

(declare-fun mapRest!8996 () (Array (_ BitVec 32) ValueCell!2299))

(declare-fun mapKey!8996 () (_ BitVec 32))

(declare-fun mapValue!8996 () ValueCell!2299)

(assert (=> mapNonEmpty!8996 (= (arr!4639 _values!649) (store mapRest!8996 mapKey!8996 mapValue!8996))))

(declare-fun b!208050 () Bool)

(declare-fun res!101132 () Bool)

(assert (=> b!208050 (=> (not res!101132) (not e!135731))))

(declare-datatypes ((List!2970 0))(
  ( (Nil!2967) (Cons!2966 (h!3608 (_ BitVec 64)) (t!7901 List!2970)) )
))
(declare-fun arrayNoDuplicates!0 (array!9775 (_ BitVec 32) List!2970) Bool)

(assert (=> b!208050 (= res!101132 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2967))))

(declare-fun b!208051 () Bool)

(declare-fun res!101134 () Bool)

(assert (=> b!208051 (=> (not res!101134) (not e!135731))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208051 (= res!101134 (and (= (size!4964 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4963 _keys!825) (size!4964 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208052 () Bool)

(declare-fun res!101136 () Bool)

(assert (=> b!208052 (=> (not res!101136) (not e!135731))))

(assert (=> b!208052 (= res!101136 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4963 _keys!825))))))

(declare-fun b!208053 () Bool)

(declare-fun res!101135 () Bool)

(assert (=> b!208053 (=> (not res!101135) (not e!135731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208053 (= res!101135 (validKeyInArray!0 k!843))))

(declare-fun b!208054 () Bool)

(assert (=> b!208054 (= e!135732 (and e!135733 mapRes!8996))))

(declare-fun condMapEmpty!8996 () Bool)

(declare-fun mapDefault!8996 () ValueCell!2299)

