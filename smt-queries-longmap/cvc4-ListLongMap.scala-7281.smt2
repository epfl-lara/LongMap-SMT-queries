; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93052 () Bool)

(assert start!93052)

(declare-fun b!1055700 () Bool)

(declare-fun e!600033 () Bool)

(declare-fun e!600035 () Bool)

(assert (=> b!1055700 (= e!600033 (not e!600035))))

(declare-fun res!704518 () Bool)

(assert (=> b!1055700 (=> res!704518 e!600035)))

(declare-fun lt!465864 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055700 (= res!704518 (bvsle lt!465864 i!1381))))

(declare-fun e!600036 () Bool)

(assert (=> b!1055700 e!600036))

(declare-fun res!704517 () Bool)

(assert (=> b!1055700 (=> (not res!704517) (not e!600036))))

(declare-datatypes ((array!66577 0))(
  ( (array!66578 (arr!32016 (Array (_ BitVec 32) (_ BitVec 64))) (size!32552 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66577)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1055700 (= res!704517 (= (select (store (arr!32016 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465864) k!2747))))

(declare-fun b!1055701 () Bool)

(declare-fun res!704524 () Bool)

(declare-fun e!600032 () Bool)

(assert (=> b!1055701 (=> (not res!704524) (not e!600032))))

(assert (=> b!1055701 (= res!704524 (= (select (arr!32016 a!3488) i!1381) k!2747))))

(declare-fun b!1055702 () Bool)

(declare-fun e!600030 () Bool)

(assert (=> b!1055702 (= e!600030 true)))

(declare-fun lt!465865 () Bool)

(declare-datatypes ((List!22328 0))(
  ( (Nil!22325) (Cons!22324 (h!23533 (_ BitVec 64)) (t!31635 List!22328)) )
))
(declare-fun contains!6188 (List!22328 (_ BitVec 64)) Bool)

(assert (=> b!1055702 (= lt!465865 (contains!6188 Nil!22325 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055703 () Bool)

(declare-fun res!704522 () Bool)

(assert (=> b!1055703 (=> res!704522 e!600030)))

(declare-fun noDuplicate!1556 (List!22328) Bool)

(assert (=> b!1055703 (= res!704522 (not (noDuplicate!1556 Nil!22325)))))

(declare-fun b!1055704 () Bool)

(declare-fun res!704523 () Bool)

(assert (=> b!1055704 (=> (not res!704523) (not e!600032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055704 (= res!704523 (validKeyInArray!0 k!2747))))

(declare-fun b!1055705 () Bool)

(declare-fun e!600031 () Bool)

(assert (=> b!1055705 (= e!600032 e!600031)))

(declare-fun res!704520 () Bool)

(assert (=> b!1055705 (=> (not res!704520) (not e!600031))))

(declare-fun lt!465866 () array!66577)

(declare-fun arrayContainsKey!0 (array!66577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055705 (= res!704520 (arrayContainsKey!0 lt!465866 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055705 (= lt!465866 (array!66578 (store (arr!32016 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32552 a!3488)))))

(declare-fun b!1055706 () Bool)

(declare-fun res!704521 () Bool)

(assert (=> b!1055706 (=> (not res!704521) (not e!600032))))

(declare-fun arrayNoDuplicates!0 (array!66577 (_ BitVec 32) List!22328) Bool)

(assert (=> b!1055706 (= res!704521 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22325))))

(declare-fun b!1055707 () Bool)

(assert (=> b!1055707 (= e!600035 e!600030)))

(declare-fun res!704519 () Bool)

(assert (=> b!1055707 (=> res!704519 e!600030)))

(assert (=> b!1055707 (= res!704519 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32552 a!3488)))))

(assert (=> b!1055707 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34590 0))(
  ( (Unit!34591) )
))
(declare-fun lt!465867 () Unit!34590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34590)

(assert (=> b!1055707 (= lt!465867 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465864 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055707 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22325)))

(declare-fun lt!465863 () Unit!34590)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66577 (_ BitVec 32) (_ BitVec 32)) Unit!34590)

(assert (=> b!1055707 (= lt!465863 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055709 () Bool)

(declare-fun e!600037 () Bool)

(assert (=> b!1055709 (= e!600036 e!600037)))

(declare-fun res!704525 () Bool)

(assert (=> b!1055709 (=> res!704525 e!600037)))

(assert (=> b!1055709 (= res!704525 (bvsle lt!465864 i!1381))))

(declare-fun res!704515 () Bool)

(assert (=> start!93052 (=> (not res!704515) (not e!600032))))

(assert (=> start!93052 (= res!704515 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32552 a!3488)) (bvslt (size!32552 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93052 e!600032))

(assert (=> start!93052 true))

(declare-fun array_inv!24796 (array!66577) Bool)

(assert (=> start!93052 (array_inv!24796 a!3488)))

(declare-fun b!1055708 () Bool)

(assert (=> b!1055708 (= e!600037 (arrayContainsKey!0 a!3488 k!2747 lt!465864))))

(declare-fun b!1055710 () Bool)

(declare-fun res!704514 () Bool)

(assert (=> b!1055710 (=> res!704514 e!600030)))

(assert (=> b!1055710 (= res!704514 (contains!6188 Nil!22325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055711 () Bool)

(assert (=> b!1055711 (= e!600031 e!600033)))

(declare-fun res!704516 () Bool)

(assert (=> b!1055711 (=> (not res!704516) (not e!600033))))

(assert (=> b!1055711 (= res!704516 (not (= lt!465864 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66577 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055711 (= lt!465864 (arrayScanForKey!0 lt!465866 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93052 res!704515) b!1055706))

(assert (= (and b!1055706 res!704521) b!1055704))

(assert (= (and b!1055704 res!704523) b!1055701))

(assert (= (and b!1055701 res!704524) b!1055705))

(assert (= (and b!1055705 res!704520) b!1055711))

(assert (= (and b!1055711 res!704516) b!1055700))

(assert (= (and b!1055700 res!704517) b!1055709))

(assert (= (and b!1055709 (not res!704525)) b!1055708))

(assert (= (and b!1055700 (not res!704518)) b!1055707))

(assert (= (and b!1055707 (not res!704519)) b!1055703))

(assert (= (and b!1055703 (not res!704522)) b!1055710))

(assert (= (and b!1055710 (not res!704514)) b!1055702))

(declare-fun m!975669 () Bool)

(assert (=> b!1055700 m!975669))

(declare-fun m!975671 () Bool)

(assert (=> b!1055700 m!975671))

(declare-fun m!975673 () Bool)

(assert (=> b!1055707 m!975673))

(declare-fun m!975675 () Bool)

(assert (=> b!1055707 m!975675))

(declare-fun m!975677 () Bool)

(assert (=> b!1055707 m!975677))

(declare-fun m!975679 () Bool)

(assert (=> b!1055707 m!975679))

(declare-fun m!975681 () Bool)

(assert (=> b!1055705 m!975681))

(assert (=> b!1055705 m!975669))

(declare-fun m!975683 () Bool)

(assert (=> b!1055701 m!975683))

(declare-fun m!975685 () Bool)

(assert (=> b!1055702 m!975685))

(declare-fun m!975687 () Bool)

(assert (=> start!93052 m!975687))

(declare-fun m!975689 () Bool)

(assert (=> b!1055706 m!975689))

(declare-fun m!975691 () Bool)

(assert (=> b!1055710 m!975691))

(declare-fun m!975693 () Bool)

(assert (=> b!1055711 m!975693))

(declare-fun m!975695 () Bool)

(assert (=> b!1055708 m!975695))

(declare-fun m!975697 () Bool)

(assert (=> b!1055703 m!975697))

(declare-fun m!975699 () Bool)

(assert (=> b!1055704 m!975699))

(push 1)

