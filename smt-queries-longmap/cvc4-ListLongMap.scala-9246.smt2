; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110828 () Bool)

(assert start!110828)

(declare-fun b_free!29663 () Bool)

(declare-fun b_next!29663 () Bool)

(assert (=> start!110828 (= b_free!29663 (not b_next!29663))))

(declare-fun tp!104311 () Bool)

(declare-fun b_and!47871 () Bool)

(assert (=> start!110828 (= tp!104311 b_and!47871)))

(declare-fun b!1311847 () Bool)

(declare-fun res!870914 () Bool)

(declare-fun e!748337 () Bool)

(assert (=> b!1311847 (=> (not res!870914) (not e!748337))))

(declare-datatypes ((array!87774 0))(
  ( (array!87775 (arr!42367 (Array (_ BitVec 32) (_ BitVec 64))) (size!42917 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87774)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52293 0))(
  ( (V!52294 (val!17771 Int)) )
))
(declare-datatypes ((ValueCell!16798 0))(
  ( (ValueCellFull!16798 (v!20398 V!52293)) (EmptyCell!16798) )
))
(declare-datatypes ((array!87776 0))(
  ( (array!87777 (arr!42368 (Array (_ BitVec 32) ValueCell!16798)) (size!42918 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87776)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311847 (= res!870914 (and (= (size!42918 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42917 _keys!1628) (size!42918 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54718 () Bool)

(declare-fun mapRes!54718 () Bool)

(assert (=> mapIsEmpty!54718 mapRes!54718))

(declare-fun b!1311848 () Bool)

(declare-fun res!870911 () Bool)

(assert (=> b!1311848 (=> (not res!870911) (not e!748337))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311848 (= res!870911 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42917 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311849 () Bool)

(assert (=> b!1311849 (= e!748337 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52293)

(declare-fun zeroValue!1296 () V!52293)

(declare-datatypes ((tuple2!22906 0))(
  ( (tuple2!22907 (_1!11464 (_ BitVec 64)) (_2!11464 V!52293)) )
))
(declare-datatypes ((List!30044 0))(
  ( (Nil!30041) (Cons!30040 (h!31249 tuple2!22906) (t!43650 List!30044)) )
))
(declare-datatypes ((ListLongMap!20563 0))(
  ( (ListLongMap!20564 (toList!10297 List!30044)) )
))
(declare-fun contains!8447 (ListLongMap!20563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5310 (array!87774 array!87776 (_ BitVec 32) (_ BitVec 32) V!52293 V!52293 (_ BitVec 32) Int) ListLongMap!20563)

(assert (=> b!1311849 (contains!8447 (getCurrentListMap!5310 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43360 0))(
  ( (Unit!43361) )
))
(declare-fun lt!585513 () Unit!43360)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!7 (array!87774 array!87776 (_ BitVec 32) (_ BitVec 32) V!52293 V!52293 (_ BitVec 64) (_ BitVec 32) Int) Unit!43360)

(assert (=> b!1311849 (= lt!585513 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!7 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311850 () Bool)

(declare-fun res!870907 () Bool)

(assert (=> b!1311850 (=> (not res!870907) (not e!748337))))

(declare-datatypes ((List!30045 0))(
  ( (Nil!30042) (Cons!30041 (h!31250 (_ BitVec 64)) (t!43651 List!30045)) )
))
(declare-fun arrayNoDuplicates!0 (array!87774 (_ BitVec 32) List!30045) Bool)

(assert (=> b!1311850 (= res!870907 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30042))))

(declare-fun b!1311851 () Bool)

(declare-fun res!870908 () Bool)

(assert (=> b!1311851 (=> (not res!870908) (not e!748337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87774 (_ BitVec 32)) Bool)

(assert (=> b!1311851 (= res!870908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870913 () Bool)

(assert (=> start!110828 (=> (not res!870913) (not e!748337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110828 (= res!870913 (validMask!0 mask!2040))))

(assert (=> start!110828 e!748337))

(assert (=> start!110828 tp!104311))

(declare-fun array_inv!32019 (array!87774) Bool)

(assert (=> start!110828 (array_inv!32019 _keys!1628)))

(assert (=> start!110828 true))

(declare-fun tp_is_empty!35393 () Bool)

(assert (=> start!110828 tp_is_empty!35393))

(declare-fun e!748334 () Bool)

(declare-fun array_inv!32020 (array!87776) Bool)

(assert (=> start!110828 (and (array_inv!32020 _values!1354) e!748334)))

(declare-fun b!1311852 () Bool)

(declare-fun e!748336 () Bool)

(assert (=> b!1311852 (= e!748336 tp_is_empty!35393)))

(declare-fun mapNonEmpty!54718 () Bool)

(declare-fun tp!104310 () Bool)

(declare-fun e!748335 () Bool)

(assert (=> mapNonEmpty!54718 (= mapRes!54718 (and tp!104310 e!748335))))

(declare-fun mapKey!54718 () (_ BitVec 32))

(declare-fun mapRest!54718 () (Array (_ BitVec 32) ValueCell!16798))

(declare-fun mapValue!54718 () ValueCell!16798)

(assert (=> mapNonEmpty!54718 (= (arr!42368 _values!1354) (store mapRest!54718 mapKey!54718 mapValue!54718))))

(declare-fun b!1311853 () Bool)

(declare-fun res!870910 () Bool)

(assert (=> b!1311853 (=> (not res!870910) (not e!748337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311853 (= res!870910 (validKeyInArray!0 (select (arr!42367 _keys!1628) from!2020)))))

(declare-fun b!1311854 () Bool)

(assert (=> b!1311854 (= e!748335 tp_is_empty!35393)))

(declare-fun b!1311855 () Bool)

(declare-fun res!870915 () Bool)

(assert (=> b!1311855 (=> (not res!870915) (not e!748337))))

(assert (=> b!1311855 (= res!870915 (contains!8447 (getCurrentListMap!5310 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311856 () Bool)

(assert (=> b!1311856 (= e!748334 (and e!748336 mapRes!54718))))

(declare-fun condMapEmpty!54718 () Bool)

(declare-fun mapDefault!54718 () ValueCell!16798)

