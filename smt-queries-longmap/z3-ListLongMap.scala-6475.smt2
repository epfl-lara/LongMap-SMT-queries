; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82672 () Bool)

(assert start!82672)

(declare-fun b_free!18823 () Bool)

(declare-fun b_next!18823 () Bool)

(assert (=> start!82672 (= b_free!18823 (not b_next!18823))))

(declare-fun tp!65589 () Bool)

(declare-fun b_and!30285 () Bool)

(assert (=> start!82672 (= tp!65589 b_and!30285)))

(declare-fun b!963933 () Bool)

(declare-fun e!543433 () Bool)

(assert (=> b!963933 (= e!543433 true)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33817 0))(
  ( (V!33818 (val!10863 Int)) )
))
(declare-datatypes ((ValueCell!10331 0))(
  ( (ValueCellFull!10331 (v!13420 V!33817)) (EmptyCell!10331) )
))
(declare-datatypes ((array!59272 0))(
  ( (array!59273 (arr!28505 (Array (_ BitVec 32) ValueCell!10331)) (size!28986 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59272)

(declare-datatypes ((array!59274 0))(
  ( (array!59275 (arr!28506 (Array (_ BitVec 32) (_ BitVec 64))) (size!28987 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59274)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33817)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33817)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-datatypes ((tuple2!14026 0))(
  ( (tuple2!14027 (_1!7024 (_ BitVec 64)) (_2!7024 V!33817)) )
))
(declare-datatypes ((List!19834 0))(
  ( (Nil!19831) (Cons!19830 (h!20992 tuple2!14026) (t!28188 List!19834)) )
))
(declare-datatypes ((ListLongMap!12713 0))(
  ( (ListLongMap!12714 (toList!6372 List!19834)) )
))
(declare-fun contains!5419 (ListLongMap!12713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3534 (array!59274 array!59272 (_ BitVec 32) (_ BitVec 32) V!33817 V!33817 (_ BitVec 32) Int) ListLongMap!12713)

(assert (=> b!963933 (contains!5419 (getCurrentListMap!3534 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28506 _keys!1686) i!803))))

(declare-datatypes ((Unit!32130 0))(
  ( (Unit!32131) )
))
(declare-fun lt!430822 () Unit!32130)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!27 (array!59274 array!59272 (_ BitVec 32) (_ BitVec 32) V!33817 V!33817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32130)

(assert (=> b!963933 (= lt!430822 (lemmaInListMapFromThenInFromSmaller!27 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!963934 () Bool)

(declare-fun res!645226 () Bool)

(declare-fun e!543432 () Bool)

(assert (=> b!963934 (=> (not res!645226) (not e!543432))))

(assert (=> b!963934 (= res!645226 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963935 () Bool)

(declare-fun res!645222 () Bool)

(assert (=> b!963935 (=> (not res!645222) (not e!543432))))

(declare-datatypes ((List!19835 0))(
  ( (Nil!19832) (Cons!19831 (h!20993 (_ BitVec 64)) (t!28189 List!19835)) )
))
(declare-fun arrayNoDuplicates!0 (array!59274 (_ BitVec 32) List!19835) Bool)

(assert (=> b!963935 (= res!645222 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19832))))

(declare-fun b!963936 () Bool)

(declare-fun e!543431 () Bool)

(declare-fun e!543430 () Bool)

(declare-fun mapRes!34432 () Bool)

(assert (=> b!963936 (= e!543431 (and e!543430 mapRes!34432))))

(declare-fun condMapEmpty!34432 () Bool)

(declare-fun mapDefault!34432 () ValueCell!10331)

(assert (=> b!963936 (= condMapEmpty!34432 (= (arr!28505 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10331)) mapDefault!34432)))))

(declare-fun b!963937 () Bool)

(declare-fun tp_is_empty!21625 () Bool)

(assert (=> b!963937 (= e!543430 tp_is_empty!21625)))

(declare-fun b!963939 () Bool)

(declare-fun e!543428 () Bool)

(assert (=> b!963939 (= e!543428 tp_is_empty!21625)))

(declare-fun b!963940 () Bool)

(declare-fun res!645228 () Bool)

(assert (=> b!963940 (=> (not res!645228) (not e!543432))))

(assert (=> b!963940 (= res!645228 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28987 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28987 _keys!1686))))))

(declare-fun b!963941 () Bool)

(declare-fun res!645224 () Bool)

(assert (=> b!963941 (=> (not res!645224) (not e!543432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59274 (_ BitVec 32)) Bool)

(assert (=> b!963941 (= res!645224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963942 () Bool)

(assert (=> b!963942 (= e!543432 (not e!543433))))

(declare-fun res!645229 () Bool)

(assert (=> b!963942 (=> res!645229 e!543433)))

(assert (=> b!963942 (= res!645229 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!28987 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!963942 (contains!5419 (getCurrentListMap!3534 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28506 _keys!1686) i!803))))

(declare-fun lt!430823 () Unit!32130)

(declare-fun lemmaInListMapFromThenInFromMinusOne!30 (array!59274 array!59272 (_ BitVec 32) (_ BitVec 32) V!33817 V!33817 (_ BitVec 32) (_ BitVec 32) Int) Unit!32130)

(assert (=> b!963942 (= lt!430823 (lemmaInListMapFromThenInFromMinusOne!30 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963943 () Bool)

(declare-fun res!645223 () Bool)

(assert (=> b!963943 (=> (not res!645223) (not e!543432))))

(assert (=> b!963943 (= res!645223 (contains!5419 (getCurrentListMap!3534 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28506 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34432 () Bool)

(declare-fun tp!65590 () Bool)

(assert (=> mapNonEmpty!34432 (= mapRes!34432 (and tp!65590 e!543428))))

(declare-fun mapKey!34432 () (_ BitVec 32))

(declare-fun mapValue!34432 () ValueCell!10331)

(declare-fun mapRest!34432 () (Array (_ BitVec 32) ValueCell!10331))

(assert (=> mapNonEmpty!34432 (= (arr!28505 _values!1400) (store mapRest!34432 mapKey!34432 mapValue!34432))))

(declare-fun res!645227 () Bool)

(assert (=> start!82672 (=> (not res!645227) (not e!543432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82672 (= res!645227 (validMask!0 mask!2110))))

(assert (=> start!82672 e!543432))

(assert (=> start!82672 true))

(declare-fun array_inv!22141 (array!59272) Bool)

(assert (=> start!82672 (and (array_inv!22141 _values!1400) e!543431)))

(declare-fun array_inv!22142 (array!59274) Bool)

(assert (=> start!82672 (array_inv!22142 _keys!1686)))

(assert (=> start!82672 tp!65589))

(assert (=> start!82672 tp_is_empty!21625))

(declare-fun b!963938 () Bool)

(declare-fun res!645225 () Bool)

(assert (=> b!963938 (=> (not res!645225) (not e!543432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963938 (= res!645225 (validKeyInArray!0 (select (arr!28506 _keys!1686) i!803)))))

(declare-fun b!963944 () Bool)

(declare-fun res!645230 () Bool)

(assert (=> b!963944 (=> (not res!645230) (not e!543432))))

(assert (=> b!963944 (= res!645230 (and (= (size!28986 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28987 _keys!1686) (size!28986 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34432 () Bool)

(assert (=> mapIsEmpty!34432 mapRes!34432))

(assert (= (and start!82672 res!645227) b!963944))

(assert (= (and b!963944 res!645230) b!963941))

(assert (= (and b!963941 res!645224) b!963935))

(assert (= (and b!963935 res!645222) b!963940))

(assert (= (and b!963940 res!645228) b!963938))

(assert (= (and b!963938 res!645225) b!963943))

(assert (= (and b!963943 res!645223) b!963934))

(assert (= (and b!963934 res!645226) b!963942))

(assert (= (and b!963942 (not res!645229)) b!963933))

(assert (= (and b!963936 condMapEmpty!34432) mapIsEmpty!34432))

(assert (= (and b!963936 (not condMapEmpty!34432)) mapNonEmpty!34432))

(get-info :version)

(assert (= (and mapNonEmpty!34432 ((_ is ValueCellFull!10331) mapValue!34432)) b!963939))

(assert (= (and b!963936 ((_ is ValueCellFull!10331) mapDefault!34432)) b!963937))

(assert (= start!82672 b!963936))

(declare-fun m!892699 () Bool)

(assert (=> b!963933 m!892699))

(declare-fun m!892701 () Bool)

(assert (=> b!963933 m!892701))

(assert (=> b!963933 m!892699))

(assert (=> b!963933 m!892701))

(declare-fun m!892703 () Bool)

(assert (=> b!963933 m!892703))

(declare-fun m!892705 () Bool)

(assert (=> b!963933 m!892705))

(assert (=> b!963938 m!892701))

(assert (=> b!963938 m!892701))

(declare-fun m!892707 () Bool)

(assert (=> b!963938 m!892707))

(declare-fun m!892709 () Bool)

(assert (=> b!963941 m!892709))

(declare-fun m!892711 () Bool)

(assert (=> start!82672 m!892711))

(declare-fun m!892713 () Bool)

(assert (=> start!82672 m!892713))

(declare-fun m!892715 () Bool)

(assert (=> start!82672 m!892715))

(declare-fun m!892717 () Bool)

(assert (=> mapNonEmpty!34432 m!892717))

(declare-fun m!892719 () Bool)

(assert (=> b!963943 m!892719))

(assert (=> b!963943 m!892701))

(assert (=> b!963943 m!892719))

(assert (=> b!963943 m!892701))

(declare-fun m!892721 () Bool)

(assert (=> b!963943 m!892721))

(declare-fun m!892723 () Bool)

(assert (=> b!963935 m!892723))

(declare-fun m!892725 () Bool)

(assert (=> b!963942 m!892725))

(assert (=> b!963942 m!892701))

(assert (=> b!963942 m!892725))

(assert (=> b!963942 m!892701))

(declare-fun m!892727 () Bool)

(assert (=> b!963942 m!892727))

(declare-fun m!892729 () Bool)

(assert (=> b!963942 m!892729))

(check-sat (not b!963942) b_and!30285 (not b_next!18823) (not b!963943) (not b!963933) (not mapNonEmpty!34432) (not b!963938) (not b!963935) tp_is_empty!21625 (not start!82672) (not b!963941))
(check-sat b_and!30285 (not b_next!18823))
