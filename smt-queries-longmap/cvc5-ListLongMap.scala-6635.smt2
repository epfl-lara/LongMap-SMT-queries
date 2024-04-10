; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83782 () Bool)

(assert start!83782)

(declare-fun b_free!19591 () Bool)

(declare-fun b_next!19591 () Bool)

(assert (=> start!83782 (= b_free!19591 (not b_next!19591))))

(declare-fun tp!68214 () Bool)

(declare-fun b_and!31271 () Bool)

(assert (=> start!83782 (= tp!68214 b_and!31271)))

(declare-fun b!978429 () Bool)

(declare-fun res!654790 () Bool)

(declare-fun e!551612 () Bool)

(assert (=> b!978429 (=> (not res!654790) (not e!551612))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978429 (= res!654790 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978430 () Bool)

(declare-fun res!654787 () Bool)

(assert (=> b!978430 (=> (not res!654787) (not e!551612))))

(declare-datatypes ((array!61197 0))(
  ( (array!61198 (arr!29456 (Array (_ BitVec 32) (_ BitVec 64))) (size!29935 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61197)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978430 (= res!654787 (validKeyInArray!0 (select (arr!29456 _keys!1544) from!1932)))))

(declare-fun b!978431 () Bool)

(assert (=> b!978431 (= e!551612 (not true))))

(declare-datatypes ((V!35097 0))(
  ( (V!35098 (val!11343 Int)) )
))
(declare-datatypes ((tuple2!14544 0))(
  ( (tuple2!14545 (_1!7283 (_ BitVec 64)) (_2!7283 V!35097)) )
))
(declare-datatypes ((List!20417 0))(
  ( (Nil!20414) (Cons!20413 (h!21575 tuple2!14544) (t!28964 List!20417)) )
))
(declare-datatypes ((ListLongMap!13241 0))(
  ( (ListLongMap!13242 (toList!6636 List!20417)) )
))
(declare-fun lt!433769 () ListLongMap!13241)

(declare-fun lt!433766 () tuple2!14544)

(declare-fun lt!433767 () tuple2!14544)

(declare-fun +!2941 (ListLongMap!13241 tuple2!14544) ListLongMap!13241)

(assert (=> b!978431 (= (+!2941 (+!2941 lt!433769 lt!433766) lt!433767) (+!2941 (+!2941 lt!433769 lt!433767) lt!433766))))

(declare-fun lt!433768 () V!35097)

(assert (=> b!978431 (= lt!433767 (tuple2!14545 (select (arr!29456 _keys!1544) from!1932) lt!433768))))

(declare-fun minValue!1220 () V!35097)

(assert (=> b!978431 (= lt!433766 (tuple2!14545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32521 0))(
  ( (Unit!32522) )
))
(declare-fun lt!433765 () Unit!32521)

(declare-fun addCommutativeForDiffKeys!569 (ListLongMap!13241 (_ BitVec 64) V!35097 (_ BitVec 64) V!35097) Unit!32521)

(assert (=> b!978431 (= lt!433765 (addCommutativeForDiffKeys!569 lt!433769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29456 _keys!1544) from!1932) lt!433768))))

(declare-datatypes ((ValueCell!10811 0))(
  ( (ValueCellFull!10811 (v!13905 V!35097)) (EmptyCell!10811) )
))
(declare-datatypes ((array!61199 0))(
  ( (array!61200 (arr!29457 (Array (_ BitVec 32) ValueCell!10811)) (size!29936 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61199)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15252 (ValueCell!10811 V!35097) V!35097)

(declare-fun dynLambda!1729 (Int (_ BitVec 64)) V!35097)

(assert (=> b!978431 (= lt!433768 (get!15252 (select (arr!29457 _values!1278) from!1932) (dynLambda!1729 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35097)

(declare-fun getCurrentListMapNoExtraKeys!3343 (array!61197 array!61199 (_ BitVec 32) (_ BitVec 32) V!35097 V!35097 (_ BitVec 32) Int) ListLongMap!13241)

(assert (=> b!978431 (= lt!433769 (+!2941 (getCurrentListMapNoExtraKeys!3343 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978433 () Bool)

(declare-fun e!551614 () Bool)

(declare-fun tp_is_empty!22585 () Bool)

(assert (=> b!978433 (= e!551614 tp_is_empty!22585)))

(declare-fun b!978434 () Bool)

(declare-fun res!654788 () Bool)

(assert (=> b!978434 (=> (not res!654788) (not e!551612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61197 (_ BitVec 32)) Bool)

(assert (=> b!978434 (= res!654788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978435 () Bool)

(declare-fun res!654789 () Bool)

(assert (=> b!978435 (=> (not res!654789) (not e!551612))))

(assert (=> b!978435 (= res!654789 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29935 _keys!1544))))))

(declare-fun mapNonEmpty!35906 () Bool)

(declare-fun mapRes!35906 () Bool)

(declare-fun tp!68215 () Bool)

(declare-fun e!551615 () Bool)

(assert (=> mapNonEmpty!35906 (= mapRes!35906 (and tp!68215 e!551615))))

(declare-fun mapKey!35906 () (_ BitVec 32))

(declare-fun mapRest!35906 () (Array (_ BitVec 32) ValueCell!10811))

(declare-fun mapValue!35906 () ValueCell!10811)

(assert (=> mapNonEmpty!35906 (= (arr!29457 _values!1278) (store mapRest!35906 mapKey!35906 mapValue!35906))))

(declare-fun mapIsEmpty!35906 () Bool)

(assert (=> mapIsEmpty!35906 mapRes!35906))

(declare-fun b!978436 () Bool)

(assert (=> b!978436 (= e!551615 tp_is_empty!22585)))

(declare-fun b!978437 () Bool)

(declare-fun res!654785 () Bool)

(assert (=> b!978437 (=> (not res!654785) (not e!551612))))

(assert (=> b!978437 (= res!654785 (and (= (size!29936 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29935 _keys!1544) (size!29936 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978438 () Bool)

(declare-fun e!551613 () Bool)

(assert (=> b!978438 (= e!551613 (and e!551614 mapRes!35906))))

(declare-fun condMapEmpty!35906 () Bool)

(declare-fun mapDefault!35906 () ValueCell!10811)

