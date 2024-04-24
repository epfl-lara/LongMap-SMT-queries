; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83316 () Bool)

(assert start!83316)

(declare-fun b_free!19141 () Bool)

(declare-fun b_next!19141 () Bool)

(assert (=> start!83316 (= b_free!19141 (not b_next!19141))))

(declare-fun tp!66703 () Bool)

(declare-fun b_and!30639 () Bool)

(assert (=> start!83316 (= tp!66703 b_and!30639)))

(declare-fun b!970901 () Bool)

(declare-fun res!649580 () Bool)

(declare-fun e!547437 () Bool)

(assert (=> b!970901 (=> (not res!649580) (not e!547437))))

(declare-datatypes ((array!60158 0))(
  ( (array!60159 (arr!28938 (Array (_ BitVec 32) (_ BitVec 64))) (size!29418 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60158)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60158 (_ BitVec 32)) Bool)

(assert (=> b!970901 (= res!649580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970902 () Bool)

(declare-fun res!649577 () Bool)

(assert (=> b!970902 (=> (not res!649577) (not e!547437))))

(declare-datatypes ((V!34369 0))(
  ( (V!34370 (val!11070 Int)) )
))
(declare-datatypes ((ValueCell!10538 0))(
  ( (ValueCellFull!10538 (v!13626 V!34369)) (EmptyCell!10538) )
))
(declare-datatypes ((array!60160 0))(
  ( (array!60161 (arr!28939 (Array (_ BitVec 32) ValueCell!10538)) (size!29419 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60160)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970902 (= res!649577 (and (= (size!29419 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29418 _keys!1717) (size!29419 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970903 () Bool)

(declare-fun e!547439 () Bool)

(declare-fun e!547438 () Bool)

(declare-fun mapRes!35068 () Bool)

(assert (=> b!970903 (= e!547439 (and e!547438 mapRes!35068))))

(declare-fun condMapEmpty!35068 () Bool)

(declare-fun mapDefault!35068 () ValueCell!10538)

(assert (=> b!970903 (= condMapEmpty!35068 (= (arr!28939 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10538)) mapDefault!35068)))))

(declare-fun b!970904 () Bool)

(declare-fun res!649575 () Bool)

(assert (=> b!970904 (=> (not res!649575) (not e!547437))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970904 (= res!649575 (validKeyInArray!0 (select (arr!28938 _keys!1717) i!822)))))

(declare-fun b!970906 () Bool)

(declare-fun res!649579 () Bool)

(assert (=> b!970906 (=> (not res!649579) (not e!547437))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970906 (= res!649579 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29418 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29418 _keys!1717))))))

(declare-fun mapIsEmpty!35068 () Bool)

(assert (=> mapIsEmpty!35068 mapRes!35068))

(declare-fun b!970907 () Bool)

(declare-fun tp_is_empty!22039 () Bool)

(assert (=> b!970907 (= e!547438 tp_is_empty!22039)))

(declare-fun b!970908 () Bool)

(declare-fun res!649576 () Bool)

(assert (=> b!970908 (=> (not res!649576) (not e!547437))))

(declare-datatypes ((List!20039 0))(
  ( (Nil!20036) (Cons!20035 (h!21203 (_ BitVec 64)) (t!28394 List!20039)) )
))
(declare-fun arrayNoDuplicates!0 (array!60158 (_ BitVec 32) List!20039) Bool)

(assert (=> b!970908 (= res!649576 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20036))))

(declare-fun res!649578 () Bool)

(assert (=> start!83316 (=> (not res!649578) (not e!547437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83316 (= res!649578 (validMask!0 mask!2147))))

(assert (=> start!83316 e!547437))

(assert (=> start!83316 true))

(declare-fun array_inv!22449 (array!60160) Bool)

(assert (=> start!83316 (and (array_inv!22449 _values!1425) e!547439)))

(assert (=> start!83316 tp_is_empty!22039))

(assert (=> start!83316 tp!66703))

(declare-fun array_inv!22450 (array!60158) Bool)

(assert (=> start!83316 (array_inv!22450 _keys!1717)))

(declare-fun b!970905 () Bool)

(assert (=> b!970905 (= e!547437 false)))

(declare-fun lt!432060 () Bool)

(declare-fun zeroValue!1367 () V!34369)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34369)

(declare-datatypes ((tuple2!14180 0))(
  ( (tuple2!14181 (_1!7101 (_ BitVec 64)) (_2!7101 V!34369)) )
))
(declare-datatypes ((List!20040 0))(
  ( (Nil!20037) (Cons!20036 (h!21204 tuple2!14180) (t!28395 List!20040)) )
))
(declare-datatypes ((ListLongMap!12879 0))(
  ( (ListLongMap!12880 (toList!6455 List!20040)) )
))
(declare-fun contains!5570 (ListLongMap!12879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3688 (array!60158 array!60160 (_ BitVec 32) (_ BitVec 32) V!34369 V!34369 (_ BitVec 32) Int) ListLongMap!12879)

(assert (=> b!970905 (= lt!432060 (contains!5570 (getCurrentListMap!3688 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28938 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35068 () Bool)

(declare-fun tp!66702 () Bool)

(declare-fun e!547441 () Bool)

(assert (=> mapNonEmpty!35068 (= mapRes!35068 (and tp!66702 e!547441))))

(declare-fun mapValue!35068 () ValueCell!10538)

(declare-fun mapRest!35068 () (Array (_ BitVec 32) ValueCell!10538))

(declare-fun mapKey!35068 () (_ BitVec 32))

(assert (=> mapNonEmpty!35068 (= (arr!28939 _values!1425) (store mapRest!35068 mapKey!35068 mapValue!35068))))

(declare-fun b!970909 () Bool)

(assert (=> b!970909 (= e!547441 tp_is_empty!22039)))

(assert (= (and start!83316 res!649578) b!970902))

(assert (= (and b!970902 res!649577) b!970901))

(assert (= (and b!970901 res!649580) b!970908))

(assert (= (and b!970908 res!649576) b!970906))

(assert (= (and b!970906 res!649579) b!970904))

(assert (= (and b!970904 res!649575) b!970905))

(assert (= (and b!970903 condMapEmpty!35068) mapIsEmpty!35068))

(assert (= (and b!970903 (not condMapEmpty!35068)) mapNonEmpty!35068))

(get-info :version)

(assert (= (and mapNonEmpty!35068 ((_ is ValueCellFull!10538) mapValue!35068)) b!970909))

(assert (= (and b!970903 ((_ is ValueCellFull!10538) mapDefault!35068)) b!970907))

(assert (= start!83316 b!970903))

(declare-fun m!899141 () Bool)

(assert (=> b!970908 m!899141))

(declare-fun m!899143 () Bool)

(assert (=> b!970905 m!899143))

(declare-fun m!899145 () Bool)

(assert (=> b!970905 m!899145))

(assert (=> b!970905 m!899143))

(assert (=> b!970905 m!899145))

(declare-fun m!899147 () Bool)

(assert (=> b!970905 m!899147))

(declare-fun m!899149 () Bool)

(assert (=> b!970901 m!899149))

(declare-fun m!899151 () Bool)

(assert (=> mapNonEmpty!35068 m!899151))

(assert (=> b!970904 m!899145))

(assert (=> b!970904 m!899145))

(declare-fun m!899153 () Bool)

(assert (=> b!970904 m!899153))

(declare-fun m!899155 () Bool)

(assert (=> start!83316 m!899155))

(declare-fun m!899157 () Bool)

(assert (=> start!83316 m!899157))

(declare-fun m!899159 () Bool)

(assert (=> start!83316 m!899159))

(check-sat (not mapNonEmpty!35068) (not b_next!19141) tp_is_empty!22039 (not start!83316) (not b!970905) (not b!970901) b_and!30639 (not b!970904) (not b!970908))
(check-sat b_and!30639 (not b_next!19141))
