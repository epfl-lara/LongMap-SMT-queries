; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8360 () Bool)

(assert start!8360)

(declare-fun b!55910 () Bool)

(declare-fun b_free!1885 () Bool)

(declare-fun b_next!1885 () Bool)

(assert (=> b!55910 (= b_free!1885 (not b_next!1885))))

(declare-fun tp!7756 () Bool)

(declare-fun b_and!3311 () Bool)

(assert (=> b!55910 (= tp!7756 b_and!3311)))

(declare-fun b!55903 () Bool)

(declare-fun b_free!1887 () Bool)

(declare-fun b_next!1887 () Bool)

(assert (=> b!55903 (= b_free!1887 (not b_next!1887))))

(declare-fun tp!7755 () Bool)

(declare-fun b_and!3313 () Bool)

(assert (=> b!55903 (= tp!7755 b_and!3313)))

(declare-fun mapNonEmpty!2747 () Bool)

(declare-fun mapRes!2748 () Bool)

(declare-fun tp!7758 () Bool)

(declare-fun e!36753 () Bool)

(assert (=> mapNonEmpty!2747 (= mapRes!2748 (and tp!7758 e!36753))))

(declare-datatypes ((V!2793 0))(
  ( (V!2794 (val!1224 Int)) )
))
(declare-datatypes ((array!3641 0))(
  ( (array!3642 (arr!1743 (Array (_ BitVec 32) (_ BitVec 64))) (size!1972 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!836 0))(
  ( (ValueCellFull!836 (v!2334 V!2793)) (EmptyCell!836) )
))
(declare-datatypes ((array!3643 0))(
  ( (array!3644 (arr!1744 (Array (_ BitVec 32) ValueCell!836)) (size!1973 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!580 0))(
  ( (LongMapFixedSize!581 (defaultEntry!2004 Int) (mask!5867 (_ BitVec 32)) (extraKeys!1895 (_ BitVec 32)) (zeroValue!1922 V!2793) (minValue!1922 V!2793) (_size!339 (_ BitVec 32)) (_keys!3624 array!3641) (_values!1987 array!3643) (_vacant!339 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!396 0))(
  ( (Cell!397 (v!2335 LongMapFixedSize!580)) )
))
(declare-datatypes ((LongMap!396 0))(
  ( (LongMap!397 (underlying!209 Cell!396)) )
))
(declare-fun thiss!992 () LongMap!396)

(declare-fun mapValue!2748 () ValueCell!836)

(declare-fun mapKey!2747 () (_ BitVec 32))

(declare-fun mapRest!2748 () (Array (_ BitVec 32) ValueCell!836))

(assert (=> mapNonEmpty!2747 (= (arr!1744 (_values!1987 (v!2335 (underlying!209 thiss!992)))) (store mapRest!2748 mapKey!2747 mapValue!2748))))

(declare-fun b!55890 () Bool)

(declare-fun e!36752 () Bool)

(declare-fun e!36758 () Bool)

(assert (=> b!55890 (= e!36752 e!36758)))

(declare-fun mapIsEmpty!2747 () Bool)

(assert (=> mapIsEmpty!2747 mapRes!2748))

(declare-fun b!55891 () Bool)

(declare-fun res!31462 () Bool)

(declare-fun e!36759 () Bool)

(assert (=> b!55891 (=> res!31462 e!36759)))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((List!1404 0))(
  ( (Nil!1401) (Cons!1400 (h!1980 (_ BitVec 64)) (t!4658 List!1404)) )
))
(declare-fun lt!22089 () List!1404)

(declare-fun arrayNoDuplicates!0 (array!3641 (_ BitVec 32) List!1404) Bool)

(assert (=> b!55891 (= res!31462 (not (arrayNoDuplicates!0 (_keys!3624 (v!2335 (underlying!209 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22089)))))

(declare-fun b!55892 () Bool)

(declare-fun e!36766 () Bool)

(declare-fun tp_is_empty!2359 () Bool)

(assert (=> b!55892 (= e!36766 tp_is_empty!2359)))

(declare-fun b!55893 () Bool)

(declare-fun res!31460 () Bool)

(assert (=> b!55893 (=> res!31460 e!36759)))

(declare-fun noDuplicate!45 (List!1404) Bool)

(assert (=> b!55893 (= res!31460 (not (noDuplicate!45 lt!22089)))))

(declare-fun b!55894 () Bool)

(declare-fun res!31453 () Bool)

(declare-fun e!36765 () Bool)

(assert (=> b!55894 (=> (not res!31453) (not e!36765))))

(declare-fun newMap!16 () LongMapFixedSize!580)

(declare-fun valid!233 (LongMapFixedSize!580) Bool)

(assert (=> b!55894 (= res!31453 (valid!233 newMap!16))))

(declare-fun b!55895 () Bool)

(declare-fun e!36757 () Bool)

(declare-fun mapRes!2747 () Bool)

(assert (=> b!55895 (= e!36757 (and e!36766 mapRes!2747))))

(declare-fun condMapEmpty!2747 () Bool)

(declare-fun mapDefault!2747 () ValueCell!836)

