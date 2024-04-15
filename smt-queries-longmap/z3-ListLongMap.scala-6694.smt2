; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84118 () Bool)

(assert start!84118)

(declare-fun b!983483 () Bool)

(declare-fun res!658133 () Bool)

(declare-fun e!554445 () Bool)

(assert (=> b!983483 (=> (not res!658133) (not e!554445))))

(declare-datatypes ((array!61788 0))(
  ( (array!61789 (arr!29752 (Array (_ BitVec 32) (_ BitVec 64))) (size!30233 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61788)

(declare-datatypes ((List!20659 0))(
  ( (Nil!20656) (Cons!20655 (h!21817 (_ BitVec 64)) (t!29441 List!20659)) )
))
(declare-fun arrayNoDuplicates!0 (array!61788 (_ BitVec 32) List!20659) Bool)

(assert (=> b!983483 (= res!658133 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20656))))

(declare-fun mapIsEmpty!36437 () Bool)

(declare-fun mapRes!36437 () Bool)

(assert (=> mapIsEmpty!36437 mapRes!36437))

(declare-fun b!983484 () Bool)

(declare-fun res!658132 () Bool)

(assert (=> b!983484 (=> (not res!658132) (not e!554445))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983484 (= res!658132 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30233 _keys!1544))))))

(declare-fun b!983485 () Bool)

(declare-fun res!658130 () Bool)

(assert (=> b!983485 (=> (not res!658130) (not e!554445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983485 (= res!658130 (validKeyInArray!0 (select (arr!29752 _keys!1544) from!1932)))))

(declare-fun b!983486 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983486 (= e!554445 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!983487 () Bool)

(declare-fun e!554443 () Bool)

(declare-fun tp_is_empty!22939 () Bool)

(assert (=> b!983487 (= e!554443 tp_is_empty!22939)))

(declare-fun res!658131 () Bool)

(assert (=> start!84118 (=> (not res!658131) (not e!554445))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84118 (= res!658131 (validMask!0 mask!1948))))

(assert (=> start!84118 e!554445))

(assert (=> start!84118 true))

(declare-datatypes ((V!35569 0))(
  ( (V!35570 (val!11520 Int)) )
))
(declare-datatypes ((ValueCell!10988 0))(
  ( (ValueCellFull!10988 (v!14081 V!35569)) (EmptyCell!10988) )
))
(declare-datatypes ((array!61790 0))(
  ( (array!61791 (arr!29753 (Array (_ BitVec 32) ValueCell!10988)) (size!30234 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61790)

(declare-fun e!554444 () Bool)

(declare-fun array_inv!23011 (array!61790) Bool)

(assert (=> start!84118 (and (array_inv!23011 _values!1278) e!554444)))

(declare-fun array_inv!23012 (array!61788) Bool)

(assert (=> start!84118 (array_inv!23012 _keys!1544)))

(declare-fun b!983488 () Bool)

(assert (=> b!983488 (= e!554444 (and e!554443 mapRes!36437))))

(declare-fun condMapEmpty!36437 () Bool)

(declare-fun mapDefault!36437 () ValueCell!10988)

(assert (=> b!983488 (= condMapEmpty!36437 (= (arr!29753 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10988)) mapDefault!36437)))))

(declare-fun b!983489 () Bool)

(declare-fun res!658129 () Bool)

(assert (=> b!983489 (=> (not res!658129) (not e!554445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61788 (_ BitVec 32)) Bool)

(assert (=> b!983489 (= res!658129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983490 () Bool)

(declare-fun res!658134 () Bool)

(assert (=> b!983490 (=> (not res!658134) (not e!554445))))

(assert (=> b!983490 (= res!658134 (and (= (size!30234 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30233 _keys!1544) (size!30234 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36437 () Bool)

(declare-fun tp!69122 () Bool)

(declare-fun e!554446 () Bool)

(assert (=> mapNonEmpty!36437 (= mapRes!36437 (and tp!69122 e!554446))))

(declare-fun mapValue!36437 () ValueCell!10988)

(declare-fun mapRest!36437 () (Array (_ BitVec 32) ValueCell!10988))

(declare-fun mapKey!36437 () (_ BitVec 32))

(assert (=> mapNonEmpty!36437 (= (arr!29753 _values!1278) (store mapRest!36437 mapKey!36437 mapValue!36437))))

(declare-fun b!983491 () Bool)

(assert (=> b!983491 (= e!554446 tp_is_empty!22939)))

(assert (= (and start!84118 res!658131) b!983490))

(assert (= (and b!983490 res!658134) b!983489))

(assert (= (and b!983489 res!658129) b!983483))

(assert (= (and b!983483 res!658133) b!983484))

(assert (= (and b!983484 res!658132) b!983485))

(assert (= (and b!983485 res!658130) b!983486))

(assert (= (and b!983488 condMapEmpty!36437) mapIsEmpty!36437))

(assert (= (and b!983488 (not condMapEmpty!36437)) mapNonEmpty!36437))

(get-info :version)

(assert (= (and mapNonEmpty!36437 ((_ is ValueCellFull!10988) mapValue!36437)) b!983491))

(assert (= (and b!983488 ((_ is ValueCellFull!10988) mapDefault!36437)) b!983487))

(assert (= start!84118 b!983488))

(declare-fun m!910139 () Bool)

(assert (=> mapNonEmpty!36437 m!910139))

(declare-fun m!910141 () Bool)

(assert (=> b!983485 m!910141))

(assert (=> b!983485 m!910141))

(declare-fun m!910143 () Bool)

(assert (=> b!983485 m!910143))

(declare-fun m!910145 () Bool)

(assert (=> b!983489 m!910145))

(declare-fun m!910147 () Bool)

(assert (=> start!84118 m!910147))

(declare-fun m!910149 () Bool)

(assert (=> start!84118 m!910149))

(declare-fun m!910151 () Bool)

(assert (=> start!84118 m!910151))

(declare-fun m!910153 () Bool)

(assert (=> b!983483 m!910153))

(check-sat (not b!983483) tp_is_empty!22939 (not start!84118) (not b!983485) (not b!983489) (not mapNonEmpty!36437))
(check-sat)
