; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82882 () Bool)

(assert start!82882)

(declare-fun b_free!18847 () Bool)

(declare-fun b_next!18847 () Bool)

(assert (=> start!82882 (= b_free!18847 (not b_next!18847))))

(declare-fun tp!65661 () Bool)

(declare-fun b_and!30345 () Bool)

(assert (=> start!82882 (= tp!65661 b_and!30345)))

(declare-fun b!965507 () Bool)

(declare-fun res!646005 () Bool)

(declare-fun e!544377 () Bool)

(assert (=> b!965507 (=> (not res!646005) (not e!544377))))

(declare-datatypes ((array!59408 0))(
  ( (array!59409 (arr!28568 (Array (_ BitVec 32) (_ BitVec 64))) (size!29048 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59408)

(declare-datatypes ((List!19813 0))(
  ( (Nil!19810) (Cons!19809 (h!20977 (_ BitVec 64)) (t!28168 List!19813)) )
))
(declare-fun arrayNoDuplicates!0 (array!59408 (_ BitVec 32) List!19813) Bool)

(assert (=> b!965507 (= res!646005 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19810))))

(declare-fun b!965508 () Bool)

(declare-fun e!544379 () Bool)

(declare-fun tp_is_empty!21649 () Bool)

(assert (=> b!965508 (= e!544379 tp_is_empty!21649)))

(declare-fun b!965509 () Bool)

(declare-fun res!646006 () Bool)

(assert (=> b!965509 (=> (not res!646006) (not e!544377))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965509 (= res!646006 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34468 () Bool)

(declare-fun mapRes!34468 () Bool)

(declare-fun tp!65662 () Bool)

(assert (=> mapNonEmpty!34468 (= mapRes!34468 (and tp!65662 e!544379))))

(declare-fun mapKey!34468 () (_ BitVec 32))

(declare-datatypes ((V!33849 0))(
  ( (V!33850 (val!10875 Int)) )
))
(declare-datatypes ((ValueCell!10343 0))(
  ( (ValueCellFull!10343 (v!13430 V!33849)) (EmptyCell!10343) )
))
(declare-fun mapValue!34468 () ValueCell!10343)

(declare-datatypes ((array!59410 0))(
  ( (array!59411 (arr!28569 (Array (_ BitVec 32) ValueCell!10343)) (size!29049 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59410)

(declare-fun mapRest!34468 () (Array (_ BitVec 32) ValueCell!10343))

(assert (=> mapNonEmpty!34468 (= (arr!28569 _values!1400) (store mapRest!34468 mapKey!34468 mapValue!34468))))

(declare-fun b!965510 () Bool)

(declare-fun res!646002 () Bool)

(assert (=> b!965510 (=> (not res!646002) (not e!544377))))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965510 (= res!646002 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29048 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29048 _keys!1686))))))

(declare-fun b!965511 () Bool)

(declare-fun e!544374 () Bool)

(declare-fun e!544378 () Bool)

(assert (=> b!965511 (= e!544374 (and e!544378 mapRes!34468))))

(declare-fun condMapEmpty!34468 () Bool)

(declare-fun mapDefault!34468 () ValueCell!10343)

(assert (=> b!965511 (= condMapEmpty!34468 (= (arr!28569 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10343)) mapDefault!34468)))))

(declare-fun b!965512 () Bool)

(assert (=> b!965512 (= e!544378 tp_is_empty!21649)))

(declare-fun mapIsEmpty!34468 () Bool)

(assert (=> mapIsEmpty!34468 mapRes!34468))

(declare-fun b!965513 () Bool)

(declare-fun e!544375 () Bool)

(assert (=> b!965513 (= e!544377 (not e!544375))))

(declare-fun res!646008 () Bool)

(assert (=> b!965513 (=> res!646008 e!544375)))

(assert (=> b!965513 (= res!646008 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29048 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33849)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33849)

(declare-datatypes ((tuple2!13968 0))(
  ( (tuple2!13969 (_1!6995 (_ BitVec 64)) (_2!6995 V!33849)) )
))
(declare-datatypes ((List!19814 0))(
  ( (Nil!19811) (Cons!19810 (h!20978 tuple2!13968) (t!28169 List!19814)) )
))
(declare-datatypes ((ListLongMap!12667 0))(
  ( (ListLongMap!12668 (toList!6349 List!19814)) )
))
(declare-fun contains!5464 (ListLongMap!12667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3582 (array!59408 array!59410 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) Int) ListLongMap!12667)

(assert (=> b!965513 (contains!5464 (getCurrentListMap!3582 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28568 _keys!1686) i!803))))

(declare-datatypes ((Unit!32252 0))(
  ( (Unit!32253) )
))
(declare-fun lt!431492 () Unit!32252)

(declare-fun lemmaInListMapFromThenInFromMinusOne!38 (array!59408 array!59410 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) (_ BitVec 32) Int) Unit!32252)

(assert (=> b!965513 (= lt!431492 (lemmaInListMapFromThenInFromMinusOne!38 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!965515 () Bool)

(declare-fun res!646004 () Bool)

(assert (=> b!965515 (=> (not res!646004) (not e!544377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59408 (_ BitVec 32)) Bool)

(assert (=> b!965515 (= res!646004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965516 () Bool)

(declare-fun res!646003 () Bool)

(assert (=> b!965516 (=> (not res!646003) (not e!544377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965516 (= res!646003 (validKeyInArray!0 (select (arr!28568 _keys!1686) i!803)))))

(declare-fun b!965517 () Bool)

(declare-fun res!646001 () Bool)

(assert (=> b!965517 (=> (not res!646001) (not e!544377))))

(assert (=> b!965517 (= res!646001 (and (= (size!29049 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29048 _keys!1686) (size!29049 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965518 () Bool)

(declare-fun res!646000 () Bool)

(assert (=> b!965518 (=> (not res!646000) (not e!544377))))

(assert (=> b!965518 (= res!646000 (contains!5464 (getCurrentListMap!3582 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28568 _keys!1686) i!803)))))

(declare-fun res!646007 () Bool)

(assert (=> start!82882 (=> (not res!646007) (not e!544377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82882 (= res!646007 (validMask!0 mask!2110))))

(assert (=> start!82882 e!544377))

(assert (=> start!82882 true))

(declare-fun array_inv!22195 (array!59410) Bool)

(assert (=> start!82882 (and (array_inv!22195 _values!1400) e!544374)))

(declare-fun array_inv!22196 (array!59408) Bool)

(assert (=> start!82882 (array_inv!22196 _keys!1686)))

(assert (=> start!82882 tp!65661))

(assert (=> start!82882 tp_is_empty!21649))

(declare-fun b!965514 () Bool)

(assert (=> b!965514 (= e!544375 true)))

(assert (=> b!965514 (contains!5464 (getCurrentListMap!3582 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28568 _keys!1686) i!803))))

(declare-fun lt!431491 () Unit!32252)

(declare-fun lemmaInListMapFromThenInFromSmaller!32 (array!59408 array!59410 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32252)

(assert (=> b!965514 (= lt!431491 (lemmaInListMapFromThenInFromSmaller!32 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(assert (= (and start!82882 res!646007) b!965517))

(assert (= (and b!965517 res!646001) b!965515))

(assert (= (and b!965515 res!646004) b!965507))

(assert (= (and b!965507 res!646005) b!965510))

(assert (= (and b!965510 res!646002) b!965516))

(assert (= (and b!965516 res!646003) b!965518))

(assert (= (and b!965518 res!646000) b!965509))

(assert (= (and b!965509 res!646006) b!965513))

(assert (= (and b!965513 (not res!646008)) b!965514))

(assert (= (and b!965511 condMapEmpty!34468) mapIsEmpty!34468))

(assert (= (and b!965511 (not condMapEmpty!34468)) mapNonEmpty!34468))

(get-info :version)

(assert (= (and mapNonEmpty!34468 ((_ is ValueCellFull!10343) mapValue!34468)) b!965508))

(assert (= (and b!965511 ((_ is ValueCellFull!10343) mapDefault!34468)) b!965512))

(assert (= start!82882 b!965511))

(declare-fun m!895135 () Bool)

(assert (=> b!965507 m!895135))

(declare-fun m!895137 () Bool)

(assert (=> b!965513 m!895137))

(declare-fun m!895139 () Bool)

(assert (=> b!965513 m!895139))

(assert (=> b!965513 m!895137))

(assert (=> b!965513 m!895139))

(declare-fun m!895141 () Bool)

(assert (=> b!965513 m!895141))

(declare-fun m!895143 () Bool)

(assert (=> b!965513 m!895143))

(declare-fun m!895145 () Bool)

(assert (=> b!965518 m!895145))

(assert (=> b!965518 m!895139))

(assert (=> b!965518 m!895145))

(assert (=> b!965518 m!895139))

(declare-fun m!895147 () Bool)

(assert (=> b!965518 m!895147))

(declare-fun m!895149 () Bool)

(assert (=> b!965515 m!895149))

(declare-fun m!895151 () Bool)

(assert (=> mapNonEmpty!34468 m!895151))

(declare-fun m!895153 () Bool)

(assert (=> start!82882 m!895153))

(declare-fun m!895155 () Bool)

(assert (=> start!82882 m!895155))

(declare-fun m!895157 () Bool)

(assert (=> start!82882 m!895157))

(declare-fun m!895159 () Bool)

(assert (=> b!965514 m!895159))

(assert (=> b!965514 m!895139))

(assert (=> b!965514 m!895159))

(assert (=> b!965514 m!895139))

(declare-fun m!895161 () Bool)

(assert (=> b!965514 m!895161))

(declare-fun m!895163 () Bool)

(assert (=> b!965514 m!895163))

(assert (=> b!965516 m!895139))

(assert (=> b!965516 m!895139))

(declare-fun m!895165 () Bool)

(assert (=> b!965516 m!895165))

(check-sat (not b_next!18847) b_and!30345 (not b!965515) (not start!82882) tp_is_empty!21649 (not b!965507) (not b!965513) (not b!965514) (not b!965518) (not mapNonEmpty!34468) (not b!965516))
(check-sat b_and!30345 (not b_next!18847))
